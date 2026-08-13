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

from xpkgindex.models import Block, Facet, FacetValue, Identity, RowSpec, Version
from xpkgindex.plugins import Plugin


def _t(en: str, zh: str, hant: str) -> Dict[str, str]:
    return {"en": en, "zh": zh, "zh-Hant": hant}


# Licenses that grant redistribution, i.e. that make a package mirror-eligible.
MIRRORABLE = {"MIT", "BSD-3-Clause", "Apache-2.0", "GPL-3.0"}

def _facet_value(values, limit: int = 0) -> str:
    """Render a multi-valued facet the way the core reads it: one string, split
    on whitespace. A value that itself contains whitespace cannot survive that
    round trip, so it is dropped rather than silently becoming two facets."""
    out = []
    for v in values:
        v = str(v).strip()
        if not v or any(ch.isspace() for ch in v):
            continue
        if v not in out:
            out.append(v)
        if limit and len(out) >= limit:
            break
    return " ".join(out)


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
        # The license is the standard xpkg field, not a dsh-private copy.
        # Absent means upstream declares none -- which is exactly what makes a
        # package un-mirrorable, so the badge and the gate read the same fact.
        # Same convention GitHub uses: a license it cannot identify is simply
        # unknown, not a special sentinel. `NONE` and `NOASSERTION` are what
        # the API hands back for "no LICENSE file" and "cannot classify"; both
        # mean the same thing to a reader and to the mirror gate -- no
        # redistribution right was granted.
        licenses = raw.get("licenses") or []
        license_id = str(licenses[0]) if licenses else "unknown"
        repo_url = str(raw.get("repo") or "")
        origin = repo_url.split("github.com/", 1)[-1].rstrip("/") if "github.com/" in repo_url else ""

        delivery = "mirrored" if mirror else "direct"
        # An un-mirrored package with a build script is the only case where
        # installing runs upstream code on the user's machine.
        needs_auth = bool(dsh.get("needs_build")) and not mirror

        ext = {
            "bundle_name": str(dsh.get("bundle_name") or ""),
            "origin": origin,
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

        # The core reads versions off `xpm`, which does not exist yet at this
        # point: descriptors here are data-only and template.lua supplies xpm
        # at index-build time. Without this the site would report "0 versions"
        # for every package, which reads as broken rather than as by-design.
        if not pkg.versions:
            pkg.versions = [
                Version(version=v,
                        urls=({"GLOBAL": "", "CN": ""} if mirror.get(v) else {}),
                        sha256=str((mirror.get(v) or {}).get("sha256") or ""))
                for v in sorted(ext["versions"])
            ]
        if not pkg.latest:
            pkg.latest = ext["latest"]

        # Upstream declaring no license is a fact the reader needs, and an
        # empty `licenses` list renders as silence.
        if not pkg.licenses and license_id and license_id != "NONE":
            pkg.licenses = [license_id]

        pkg.facets["delivery"] = delivery
        # License stays a fact on the package page (it is what gates mirroring)
        # but is not a browsing axis -- nobody picks a plugin by SPDX id.
        # pkg.facets is Dict[str, str] and the core splits multi-valued facets
        # on whitespace (`str(...).split()` in build.py). Assigning a list here
        # made every value render as its Python repr -- "['web-ui'," and
        # "'session']" showed up as separate facet buttons. So: join with
        # spaces, and drop any value containing whitespace, which would
        # otherwise silently split into two facets.
        pkg.facets["category"] = _facet_value(
            c for c in ext["categories"] if c and c != "dsh-plugin")
        pkg.facets["keyword"] = _facet_value(
            (k for k in ext["keywords"] if k and k != "dsh"), limit=6)

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
            Facet(key="category", label=_t("category", "分类", "分類"), weight=20),
            Facet(key="keyword", label=_t("keyword", "关键字", "關鍵字"), weight=30),
        ]

    def row(self, pkg) -> RowSpec:
        """The card leads with delivery, because that is the property a reader
        cannot recover from the package name or description.

        The strip shows the UPSTREAM REPO, not a `dsh plugin add <name>`
        command. Showing the latter would be actively wrong: `bundle_name` is
        the package.json name, and in this ecosystem those are not resolvable
        identifiers -- `@dsh-external/dsh-ads` is not on npm, so anyone copying
        that line would get a 404. The install command the card already carries
        (`xlings install dsh:<name>`) is the one that works.
        """
        ext = pkg.extensions.get("dsh", {})
        return RowSpec(
            variant="card",
            tone=DELIVERY_TONES.get(ext.get("delivery"), "neutral"),
            lead=ext.get("delivery") or "direct",
            code=(f"github.com/{ext['origin']}" if ext.get("origin") else ""),
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
                    "Its license is unknown -- upstream declares none that can "
                    "be identified -- so this index has no right to mirror it.",
                    "它的许可证未知 —— 上游没有声明可识别的许可证 —— 本索引无权镜像。",
                    "它的授權未知 —— 上游沒有宣告可識別的授權 —— 本索引無權鏡像。",
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
                ref = str(entry.get("commit") or "")
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
