"""dsh ecosystem renderer for xpkgindex.

The index carries three tiers, and the tier is the first thing a reader needs:

  Agent    dsh + a composed plugin set = a complete, runnable Agent. Installing
           one creates its profile and boots with `dsh --profile <name>`.
  group    a reusable set of plugins that compose cleanly together.
  plugin   one atom: a single upstream profile bundle.

The second thing they must not have to guess is **whether the bytes they
install are reproducible**. A plugin here arrives one of two ways:

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

import json
import os
from typing import Any, Dict, List, Optional

from xpkgindex.models import Block, Facet, FacetValue, Identity, RowSpec, Version
from xpkgindex.plugins import Plugin


def _t(en: str, zh: str, hant: str) -> Dict[str, str]:
    return {"en": en, "zh": zh, "zh-Hant": hant}


# Licenses that grant redistribution, i.e. that make a package mirror-eligible.
MIRRORABLE = {"MIT", "BSD-3-Clause", "Apache-2.0", "GPL-3.0"}

_HERE = os.path.dirname(os.path.abspath(__file__))
_ROOT = os.path.dirname(os.path.dirname(_HERE))


def _npm_index() -> Dict[str, Any]:
    """Which bundles npm actually serves, resolved at generation time.

    Rendering must never query npm: a page whose contents depend on a network
    call made while building is a page that quietly changes meaning when the
    call fails. tools/check_npm.py resolves it and commits the answer.
    """
    try:
        with open(os.path.join(_ROOT, "tools", "npm.json"), encoding="utf-8") as f:
            return json.load(f)
    except (OSError, ValueError):
        return {}


NPM = _npm_index()

TIERS = {"profile": "agent", "group": "group", "plugin": "plugin"}
TIER_TONES = {"agent": "header", "group": "module", "plugin": "neutral"}

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

    @staticmethod
    def _native_install(pkg, ext: Dict[str, Any]) -> str:
        """`dsh plugin --profile <p> add <spec>`, or "" when there is none.

        The spec is chosen by measurement, never by the shape of the name.
        `bundle_name` is the package's own package.json name and a bare name
        does not imply publication, so npm.json -- resolved at generation time
        for both the name AND our pinned version -- decides. Everything else
        installs from the commit the descriptor already pins, which is always
        available. Printing a command that 404s is worse than printing none.
        """
        if ext["kind"] != "plugin":
            return ""

        profile = ext["profile"] or "web"
        entry = NPM.get(pkg.identity.name) or {}
        if entry.get("pinned_published") and ext["latest"]:
            spec = f'{entry["name"]}@{ext["latest"]}'
        elif ext["origin"] and ext["latest"]:
            commit = str((ext["versions"].get(ext["latest"]) or {}).get("commit") or "")
            if not commit:
                return ""
            spec = f'github:{ext["origin"]}#{commit}'
        else:
            return ""
        return f"dsh plugin --profile {profile} add {spec}"

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

        kind = str(dsh.get("kind") or "plugin")
        tier = TIERS.get(kind, "plugin")
        latest = str(dsh.get("latest") or "")

        ext = {
            "kind": kind,
            "tier": tier,
            "profile": str(dsh.get("profile") or ""),
            "members": list(dsh.get("members") or []),
            "groups": list(dsh.get("groups") or []),
            "bundle_name": str(dsh.get("bundle_name") or ""),
            "origin": origin,
            "license": license_id,
            "delivery": delivery,
            "mirror_eligible": license_id in MIRRORABLE,
            "needs_build": bool(dsh.get("needs_build")),
            "needs_auth": needs_auth,
            "patch": str(dsh.get("patch") or "./cordis.patch.yml"),
            "versions": dsh.get("versions") or {},
            "latest": latest,
            "keywords": raw.get("keywords") or [],
            "authors": raw.get("authors") or [],
            "categories": raw.get("categories") or [],
        }
        ext["native"] = self._native_install(pkg, ext)
        pkg.extensions["dsh"] = ext

        # A composite's members ARE its xpkg dependencies -- that is how
        # template.lua declares them, and how xlings installs them. Saying so
        # here puts them on the core's own axis, so each member page gains a
        # linked `required by` pointing back at every group and Agent that
        # contains it. Inventing a private vocabulary for it would have left
        # that relationship visible from only one side.
        if not pkg.deps and ext["members"]:
            pkg.deps = [m.get("name", "") for m in ext["members"] if m.get("name")]

        # dsh installs a plugin itself, so its own command leads and this
        # index's goes below it (design 6.1). Hiding a path the reader already
        # has would be the wrong kind of advocacy -- the index earns its place
        # by saying what it adds, not by omitting the alternative.
        #
        # A group and an Agent get no native line at all: dsh has no entry
        # point that installs a profile (design 2.4), so there is nothing
        # truthful to print. That is a capability fact, not a layout choice.
        if ext["native"]:
            pkg.extensions.setdefault("_core", {})["install_command"] = ext["native"]

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

        pkg.facets["tier"] = tier
        pkg.facets["delivery"] = delivery
        # License stays a fact on the package page (it is what gates mirroring)
        # but is not a browsing axis -- nobody picks a plugin by SPDX id.
        # pkg.facets is Dict[str, str] and the core splits multi-valued facets
        # on whitespace (`str(...).split()` in build.py). Assigning a list here
        # made every value render as its Python repr -- "['web-ui'," and
        # "'session']" showed up as separate facet buttons. So: join with
        # spaces, and drop any value containing whitespace, which would
        # otherwise silently split into two facets.
        # `dsh-plugin` / `dsh-group` / `dsh-agent` name the tier, which already
        # has its own axis. Leaving them here would put the same distinction on
        # two facets, where filtering by one silently narrows the other.
        pkg.facets["category"] = _facet_value(
            c for c in ext["categories"]
            if c and c not in ("dsh-plugin", "dsh-group", "dsh-agent"))
        pkg.facets["keyword"] = _facet_value(
            (k for k in ext["keywords"] if k and k != "dsh"), limit=6)

        badges = pkg.extensions.setdefault("_badges", [])
        if tier != "plugin":
            badges.append(tier)
        badges.append(delivery)
        if needs_auth:
            badges.append("build-opt-in")

    def facets(self) -> List[Facet]:
        return [
            Facet(
                key="tier",
                label=_t("kind", "类型", "類型"),
                weight=5,
                values=[
                    FacetValue(key="agent",
                               label=_t("Agent", "Agent", "Agent"),
                               tone="header"),
                    FacetValue(key="group",
                               label=_t("group", "插件组", "外掛組"),
                               tone="module"),
                    FacetValue(key="plugin",
                               label=_t("plugin", "插件", "外掛"),
                               tone="neutral"),
                ],
            ),
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
        """An Agent and a group lead with what they are; a plugin leads with
        how its bytes arrive, because that is the property a reader cannot
        recover from the name or the description.

        A plugin's strip shows the UPSTREAM REPO rather than a bare
        `dsh plugin add <bundle_name>`: in this ecosystem those names are not
        resolvable identifiers -- `@dsh-external/dsh-ads` is not on npm -- so
        that line would 404 for anyone who copied it. The resolvable form is
        long enough to belong on the package page, not in a listing row, and
        the page carries it as the leading install command.

        An Agent's strip is the command that boots it, which is the whole
        point of the tier: install it, then type this.
        """
        ext = pkg.extensions.get("dsh", {})
        tier = ext.get("tier", "plugin")

        if tier == "agent":
            p = ext.get("profile") or "web"
            code = "dsh web" if p == "web" else f"dsh --profile {p}"
        elif tier == "group":
            n = len(ext.get("members") or [])
            code = f"{n} plugins"
        else:
            code = f"github.com/{ext['origin']}" if ext.get("origin") else ""

        return RowSpec(
            variant="card",
            tone=(TIER_TONES[tier] if tier != "plugin"
                  else DELIVERY_TONES.get(ext.get("delivery"), "neutral")),
            lead=(tier if tier != "plugin" else (ext.get("delivery") or "direct")),
            code=code,
            badges=list(pkg.extensions.get("_badges", [])),
        )

    def detail_blocks(self, pkg) -> List[Block]:
        ext = pkg.extensions.get("dsh", {})
        blocks: List[Block] = []
        delivery = ext.get("delivery")
        tier = ext.get("tier", "plugin")
        ref = pkg.identity.install_ref

        # Where a plugin's native command leads, this index's follows -- and
        # says what it adds, since the two are not equivalent: the native one
        # goes direct with no CN mirror and no checksum.
        if ext.get("native"):
            blocks.append(Block(
                kind="code", weight=1,
                title=_t("Install with mirror acceleration",
                         "用镜像加速安装", "用鏡像加速安裝"),
                data={
                    "code": f"xlings install dsh:{ref} -y",
                    "caption": _t(
                        "The command above installs straight from upstream. "
                        "This one goes through the index instead: a "
                        "sha256-checked tarball with a CN mirror where the "
                        "licence permits one.",
                        "上面那条直连上游。这条走本索引：带 sha256 校验的 tarball，"
                        "许可证允许时还有 CN 镜像。",
                        "上面那條直連上游。這條走本索引：帶 sha256 校驗的 tarball，"
                        "授權允許時還有 CN 鏡像。",
                    ),
                }))

        if tier == "agent":
            p = ext.get("profile") or "web"
            launch = "dsh web" if p == "web" else f"dsh --profile {p}"
            blocks.append(Block(
                kind="callout", weight=2,
                data={"tone": "header", "text": _t(
                    f"An Agent: installing composes {len(ext.get('members') or [])} "
                    f"plugins into the profile '{p}'. Boot it with `{launch}`.",
                    f"一个 Agent：安装即把 {len(ext.get('members') or [])} 个插件"
                    f"组合进 profile『{p}』，用 `{launch}` 启动。",
                    f"一個 Agent：安裝即把 {len(ext.get('members') or [])} 個外掛"
                    f"組合進 profile『{p}』，用 `{launch}` 啟動。",
                )}))
        elif tier == "group":
            blocks.append(Block(
                kind="callout", weight=2,
                data={"tone": "module", "text": _t(
                    "A reusable group: these plugins are verified not to "
                    "replace the same base row, so they compose. Installing it "
                    "installs all of them.",
                    "一个可复用插件组：这些插件经校验不会替换同一个 base 行，"
                    "因此可以共存。安装它就是安装全部成员。",
                    "一個可重用外掛組：這些外掛經校驗不會替換同一個 base 行，"
                    "因此可以共存。安裝它就是安裝全部成員。",
                )}))

        members = ext.get("members") or []
        if members:
            # Members are xpkg packages in this very index, so they are
            # rendered as dependencies -- the core's own axis, which also
            # gives each member page a `required by` link back. A private
            # list block would have been a second, unlinked vocabulary for
            # a relationship xpkg already has a word for.
            blocks.append(Block(
                kind="table", weight=20,
                title=_t(f"Members ({len(members)})", f"成员（{len(members)}）",
                         f"成員（{len(members)}）"),
                data={"head": [_t("package", "包", "套件"),
                               _t("bundle in the profile manifest",
                                  "profile 清单里的 bundle 名",
                                  "profile 清單裡的 bundle 名")],
                      "rows": [[m.get("name", ""), m.get("bundle", "")]
                               for m in members]}))
            if ext.get("groups"):
                blocks.append(Block(
                    kind="kv", weight=21,
                    title=_t("Built from", "组合自", "組合自"),
                    data={"items": [{"key": _t("groups", "插件组", "外掛組"),
                                     "value": ", ".join(ext["groups"]),
                                     "mono": True}]}))
            return blocks

        if delivery == "mirrored":
            note = _t(
                "Mirrored to xlings-res with a sha256 and a CN mirror: "
                "installs offline.",
                "已镜像到 xlings-res，带 sha256 与 CN 镜像：可离线安装。",
                "已鏡像到 xlings-res，帶 sha256 與 CN 鏡像：可離線安裝。",
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
        if ext.get("profile"):
            # Recorded from the plugin's own README, not derived here: the
            # profile name belongs to upstream, and every earlier attempt to
            # infer one made upstream's own examples wrong under this index.
            items.append({"key": _t("README profile", "README 的 profile",
                                    "README 的 profile"),
                          "value": ext["profile"], "mono": True})
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
