"""dsh plugin-ecosystem renderer for xpkgindex.

The one thing a reader of this index must not have to guess is **whether the
bytes they install are reproducible**. A plugin here arrives one of two ways:

  mirrored  the tarball lives in xlings-res with a sha256 and a CN mirror; it
            installs offline, survives upstream deleting the repo, and needed
            no build authorisation because the build ran in this index's CI
  direct    pnpm fetches it from GitHub at a pinned commit; no CN mirror is
            possible, and if upstream disappears it cannot be reinstalled

That split is not a preference, it is the license: mirroring is
redistribution. 42 of the 169 bundles surveyed carry no LICENSE at all, so
this index has no right to mirror them -- and hiding that would imply a
guarantee the index cannot make. Hence the badge is the first facet, not a
footnote.
"""

from __future__ import annotations

import os
from typing import Any, Dict, List, Optional

from xpkgindex.models import Block, Facet, FacetValue, Identity, RowSpec
from xpkgindex.plugins import Plugin


def _t(en: str, zh: str, hant: str) -> Dict[str, str]:
    return {"en": en, "zh": zh, "zh-Hant": hant}


# Licenses that grant redistribution, i.e. that make a package mirror-eligible.
MIRRORABLE = {"MIT", "BSD-3-Clause", "Apache-2.0", "GPL-3.0"}

DELIVERY_TONES = {
    "mirrored": "module",   # brand blue -- the reproducible path
    "direct": "tool",
}


class DshPlugin(Plugin):
    api_version = 1
    name = "dsh"

    def on_index(self, ctx) -> None:
        # References resolve as `dsh:<name>`; the namespace comes from the index
        # repo, not from a per-descriptor field.
        ctx.meta.set("default_namespace", "dsh")

    def identity(self, raw: Dict[str, Any], path: str) -> Optional[Identity]:
        name = str(raw.get("name") or "")
        if not name:
            name = os.path.basename(path)[: -len(".lua")]
        return Identity.plain("dsh", name)

    def on_package(self, pkg, raw: Dict[str, Any]) -> None:
        dsh = raw.get("dsh") or {}
        mirror = dsh.get("mirror") or {}
        license_id = str(dsh.get("license") or "")

        delivery = "mirrored" if mirror else "direct"
        # An un-mirrored package with a build script is the only case where
        # installing runs upstream code on the user's machine.
        needs_auth = bool(dsh.get("needs_build")) and not mirror

        ext = {
            "bundle_name": str(dsh.get("bundle_name") or ""),
            "origin": str(dsh.get("origin") or ""),
            "source": str(dsh.get("source") or "github"),
            "license": license_id,
            "delivery": delivery,
            "mirror_eligible": license_id in MIRRORABLE,
            "needs_build": bool(dsh.get("needs_build")),
            "needs_auth": needs_auth,
            "patch": str(dsh.get("patch") or "./cordis.patch.yml"),
            "versions": dsh.get("versions") or {},
            "latest": str(dsh.get("latest") or ""),
            "keywords": raw.get("keywords") or [],
            "authors": raw.get("authors") or [],
            "categories": raw.get("categories") or [],
        }
        pkg.extensions["dsh"] = ext

        pkg.facets["delivery"] = delivery
        if license_id:
            pkg.facets["license"] = license_id
        if pkg.status:
            pkg.facets["status"] = pkg.status

        badges = pkg.extensions.setdefault("_badges", [])
        badges.append(delivery)
        if needs_auth:
            badges.append("build-opt-in")

    def facets(self) -> List[Facet]:
        return [
            Facet(
                key="delivery",
                label=_t("delivery", "分发方式", "分發方式"),
                weight=10,
                values=[
                    FacetValue(key="mirrored",
                               label=_t("mirrored", "已镜像", "已鏡像"),
                               tone="module"),
                    FacetValue(key="direct",
                               label=_t("direct from upstream", "直连上游", "直連上游"),
                               tone="tool"),
                ],
            ),
            Facet(key="license", label=_t("license", "许可证", "授權"), weight=20),
            Facet(key="status", label=_t("status", "状态", "狀態"), weight=30),
        ]

    def row(self, pkg) -> RowSpec:
        """The card leads with delivery, because that is the property a reader
        cannot recover from the package name or description."""
        ext = pkg.extensions.get("dsh", {})
        return RowSpec(
            variant="card",
            tone=DELIVERY_TONES.get(ext.get("delivery"), "neutral"),
            lead=ext.get("delivery") or "direct",
            code=(f"dsh plugin add {ext.get('bundle_name')}"
                  if ext.get("bundle_name") else ""),
            badges=list(pkg.extensions.get("_badges", [])),
        )

    def detail_blocks(self, pkg) -> List[Block]:
        ext = pkg.extensions.get("dsh", {})
        blocks: List[Block] = []
        delivery = ext.get("delivery")

        if delivery == "mirrored":
            note = _t(
                "Mirrored to xlings-res with a sha256 and a CN mirror: installs "
                "offline, survives upstream deletion, and needs no build "
                "authorisation.",
                "已镜像到 xlings-res，带 sha256 与 CN 镜像：可离线安装，上游删库后仍可装回，"
                "且不需要构建授权。",
                "已鏡像到 xlings-res，帶 sha256 與 CN 鏡像：可離線安裝，上游刪庫後仍可裝回，"
                "且不需要建置授權。",
            )
        else:
            lic = ext.get("license") or "unknown"
            if ext.get("mirror_eligible"):
                why = _t(
                    f"License {lic} permits mirroring; the tarball is not "
                    f"published yet.",
                    f"许可证 {lic} 允许镜像，只是 tarball 尚未发布。",
                    f"授權 {lic} 允許鏡像，只是 tarball 尚未發布。",
                )
            else:
                why = _t(
                    f"Upstream declares no redistributable license ({lic}), so "
                    f"this index has no right to mirror it.",
                    f"上游没有可再分发的许可证（{lic}），本索引无权镜像。",
                    f"上游沒有可再分發的授權（{lic}），本索引無權鏡像。",
                )
            note = {
                k: (
                    {"en": "Installed straight from GitHub at a pinned commit. "
                           "No CN mirror, and it cannot be reinstalled if "
                           "upstream disappears. ",
                     "zh": "从 GitHub 按 pin 的 commit 直装。没有 CN 加速，"
                           "上游消失后无法再装回。",
                     "zh-Hant": "從 GitHub 按 pin 的 commit 直裝。沒有 CN 加速，"
                                "上游消失後無法再裝回。"}[k] + why[k]
                )
                for k in ("en", "zh", "zh-Hant")
            }

        blocks.append(Block(
            kind="callout", weight=5,
            data={"tone": DELIVERY_TONES.get(delivery, "neutral"), "text": note}))

        if ext.get("needs_auth"):
            blocks.append(Block(
                kind="callout", weight=6,
                data={"tone": "tool", "text": _t(
                    "This package ships a `prepare` build script. Installing it "
                    "un-mirrored executes its code on your machine at install "
                    "time, outside any sandbox. Opt in with DSH_ALLOW_BUILDS=1.",
                    "该包带 `prepare` 构建脚本。未镜像时安装 = 在你的机器上执行它的代码，"
                    "且不在任何沙箱内。确认信任后用 DSH_ALLOW_BUILDS=1 显式授权。",
                    "該套件帶 `prepare` 建置腳本。未鏡像時安裝 = 在你的機器上執行它的程式碼，"
                    "且不在任何沙箱內。確認信任後用 DSH_ALLOW_BUILDS=1 顯式授權。",
                )}))

        items = []
        if ext.get("bundle_name"):
            items.append({"key": _t("bundle", "bundle 包名", "bundle 套件名"),
                          "value": ext["bundle_name"], "mono": True})
        if ext.get("origin"):
            items.append({"key": _t("upstream", "上游仓库", "上游倉庫"),
                          "value": ext["origin"], "mono": True})
        if ext.get("license"):
            items.append({"key": _t("license", "许可证", "授權"),
                          "value": ext["license"]})
        items.append({"key": _t("bundle patch", "bundle patch", "bundle patch"),
                      "value": ext.get("patch", ""), "mono": True})
        if items:
            blocks.append(Block(kind="kv",
                                title=_t("Plugin", "插件信息", "外掛資訊"),
                                data={"items": items}, weight=30))

        # Pinned commits, so a reader can audit exactly what gets installed.
        versions = ext.get("versions") or {}
        if versions:
            pins = []
            for ver in sorted(versions):
                entry = versions[ver] or {}
                ref = str(entry.get("ref") or "")
                pins.append({"key": ver, "value": ref[:12] or "-", "mono": True})
            blocks.append(Block(kind="kv",
                                title=_t("Pinned commits", "版本与 commit",
                                         "版本與 commit"),
                                data={"items": pins}, weight=40))

        if ext.get("authors"):
            blocks.append(Block(
                kind="kv", title=_t("Credits", "致谢", "致謝"), weight=50,
                data={"items": [{"key": "authors",
                                 "value": ", ".join(str(a) for a in ext["authors"])}]}))

        tags = [str(k) for k in ext.get("keywords") or []]
        if tags:
            blocks.append(Block(kind="list",
                                title=_t("Keywords", "关键词", "關鍵字"),
                                collapsed=True, weight=60,
                                data={"items": tags}))
        return blocks
