"""Schema and policy checks over every descriptor in pkgs/.

Descriptors here are DATA ONLY -- `type`, `xpm` and the four lifecycle hooks
come from template.lua, appended at index-build time. So these tests check the
data contract, and tests/libxpkg_sandbox_harness.lua checks that the append
still works under the runtime that actually performs it.
"""
import json
import pathlib
import re
import sys

import pytest

ROOT = pathlib.Path(__file__).resolve().parent.parent
PKGS = sorted((ROOT / "pkgs").rglob("*.lua"))

MIRRORABLE = {"MIT", "BSD-3-Clause", "Apache-2.0", "GPL-3.0"}
SHA_RE = re.compile(r"^[0-9a-f]{40}$")


def _field(body: str, name: str):
    m = re.search(rf'{name}\s*=\s*"([^"]*)"', body)
    return m.group(1) if m else None


def _dsh_block(body: str) -> str:
    i = body.index("dsh = {")
    depth, j = 0, i + len("dsh = ")
    for k in range(j, len(body)):
        if body[k] == "{":
            depth += 1
        elif body[k] == "}":
            depth -= 1
            if depth == 0:
                return body[i:k + 1]
    raise AssertionError("unterminated dsh block")


KINDS = {"plugin", "group", "profile"}


def _kind(body: str) -> str:
    """plugin | group | profile. Absent is a schema error, never a default --
    see TestKind."""
    return _field(_dsh_block(body), "kind") or ""


def _members(body: str) -> list:
    """[(descriptor name, bundle name)] — the bundle name is what the profile
    manifest records, and the two differ often enough that conflating them
    broke uninstall."""
    d = _dsh_block(body)
    m = re.search(r"members = \{(.*?)\n        \}", d, re.S)
    if not m:
        return []
    return re.findall(r'name = "([^"]+)", version = "([^"]+)", '
                      r'bundle = "([^"]+)", commit = "([^"]*)"', m.group(1))


def _bundle_at(body: str, version: str) -> str:
    """The bundle name for one version.

    Upstream renames its npm package -- dsh-cc-tui shipped as `dsh-cc-tui`
    through 0.3.3 and became `@deepseek-harness-tui/dsh-tui` at 0.5.0 -- so
    the manifest name is a property of the VERSION. `bundle_name` describes
    `latest`; a version that differs says so inline. Same correction the
    mirror lookup needed: per version, not per package.
    """
    d = _dsh_block(body)
    m = re.search(rf'\["{re.escape(version)}"\]\s*=\s*'
                  r'\{[^}]*bundle = "([^"]+)"', d)
    return m.group(1) if m else (_field(d, "bundle_name") or "")


@pytest.fixture(scope="module", params=[p for p in PKGS], ids=lambda p: p.stem)
def pkg(request):
    path = request.param
    return path, path.read_text(encoding="utf-8")


def test_descriptors_exist():
    assert PKGS, "no descriptors under pkgs/"


class TestShape:
    @pytest.mark.static
    def test_required_fields(self, pkg):
        _, body = pkg
        for f in ("name", "description", "repo", "spec"):
            assert _field(body, f), f"missing {f}"

    @pytest.mark.static
    def test_filename_matches_name(self, pkg):
        path, body = pkg
        assert _field(body, "name") == path.stem, "file name must equal package.name"

    @pytest.mark.static
    def test_letter_directory(self, pkg):
        path, _ = pkg
        assert path.parent.name == path.stem[0], "pkgs/<first-letter>/<name>.lua"

    @pytest.mark.static
    def test_data_only(self, pkg):
        """No hooks, no xpm, no type -- those belong to template.lua.

        A descriptor that defines its own would be silently overridden by the
        appended template, which is worse than failing here.
        """
        _, body = pkg
        for forbidden in ("function install", "function config", "function uninstall",
                          "function installed", "xpm =", "type ="):
            assert forbidden not in body, f"{forbidden!r} belongs in template.lua"


class TestDshBlock:
    @pytest.mark.static
    def test_has_dsh_block(self, pkg):
        _, body = pkg
        assert "dsh = {" in body

    @pytest.mark.static
    def test_bundle_name(self, pkg):
        """A plugin IS one upstream bundle, so it names it. A group and an
        Agent are manifests over other packages and have no bundle of their
        own -- requiring one would force an invented name into the profile
        manifest, where it would resolve to nothing."""
        _, body = pkg
        d = _dsh_block(body)
        if _kind(body) != "plugin":
            assert not _field(d, "bundle_name"), \
                "only a plugin names an upstream bundle"
            return
        assert _field(d, "bundle_name"), "bundle_name required"

    @pytest.mark.static
    def test_origin_comes_from_the_standard_repo_field(self, pkg):
        """`repo` is xpkg's own field; `dsh.origin` would be a second copy."""
        _, body = pkg
        repo = _field(body, "repo") or ""
        assert "github.com/" in repo, "repo must be a github URL"
        assert len(repo.split("github.com/", 1)[1].strip("/").split("/")) == 2

    @pytest.mark.static
    def test_no_fields_xpkg_already_has(self, pkg):
        """Nothing in `dsh` may duplicate a standard xpkg field.

        license -> package.licenses, origin/source -> package.repo. A second
        copy of a fact is a second thing to keep in sync, and they drift.
        """
        _, body = pkg
        d = _dsh_block(body)
        for dup in ("license", "origin", "source"):
            assert not _field(d, dup), (
                f"dsh.{dup} duplicates a standard xpkg field"
            )

    @pytest.mark.static
    def test_every_version_pins_a_40_hex_commit(self, pkg):
        """xpkg can express a git URL but not a commit, so this index adds one.

        It is spelled `commit`, never `ref`: xpkg already uses `ref` for
        ALIASES -- `["latest"] = { ref = "2.13.5" }` and
        `ubuntu = { ref = "linux" }` -- and template.lua emits exactly that
        form into the same synthesised file. One word, two meanings, in one
        file is how a reader ends up trusting the wrong one.

        The pin matters because package names are not trustworthy here: 36
        community repos name themselves into the `@deepseek-ai/` scope that
        DeepSeek owns on npm.
        """
        _, body = pkg
        d = _dsh_block(body)
        if _kind(body) != "plugin":
            # A group and an Agent have no upstream of their own to pin, so
            # their `versions` block carries no commit. They do record their
            # members' pins -- that is what makes the composite mean one fixed
            # set of bytes -- so the check is scoped to the versions block
            # rather than to the whole descriptor.
            vblock = d[d.index("versions = {"):]
            assert "commit" not in vblock[:vblock.index("},")], \
                "only a plugin pins an upstream commit of its own"
            return
        commits = re.findall(r'commit\s*=\s*"([^"]*)"', d)
        assert commits, "every version must pin a commit"
        for c in commits:
            assert SHA_RE.match(c), f"commit must be 40-hex, got {c!r}"

    @pytest.mark.static
    def test_commit_count_matches_version_count(self, pkg):
        """Guards the previous test against silently passing on zero work --
        it did exactly that once, when the `source` field it branched on was
        removed and the early return made it a no-op."""
        _, body = pkg
        if _kind(body) != "plugin":
            return
        d = _dsh_block(body)
        vblock = d[d.index("versions = {"):]
        vblock = vblock[:vblock.index("},")]
        assert len(re.findall(r'commit\s*=', vblock)) == \
               len(re.findall(r'\["[^"]+"\]\s*=', vblock))

    @pytest.mark.static
    def test_latest_points_at_a_declared_version(self, pkg):
        _, body = pkg
        d = _dsh_block(body)
        latest = _field(d, "latest")
        versions = re.findall(r'\["([^"]+)"\]\s*=\s*\{', d)
        assert latest, "latest required"
        assert latest in versions, f"latest={latest!r} is not a declared version"

    @pytest.mark.static
    def test_needs_build_declared(self, pkg):
        _, body = pkg
        d = _dsh_block(body)
        assert re.search(r"needs_build\s*=\s*(true|false)", d), \
            "needs_build must be declared explicitly (it gates code execution)"


class TestKind:
    """`kind` is what the three-tier model turns on, so it must be present and
    it must be one of the three. It lives under `dsh.*` rather than in xpkg's
    `type` because `type` is a closed enum -- libxpkg's parse_type() maps any
    unknown string to PackageType::Package, so `type = "dsh-agent"` would not
    fail, it would evaporate."""

    @pytest.mark.static
    def test_declared_and_known(self, pkg):
        _, body = pkg
        k = _kind(body)
        assert k, "dsh.kind required"
        assert k in KINDS, f"unknown kind {k!r}, expected one of {sorted(KINDS)}"

    @pytest.mark.static
    def test_kind_is_not_smuggled_into_type(self, pkg):
        _, body = pkg
        assert 'type = "dsh' not in body, \
            "xpkg's type is a closed enum; an unknown value is silently dropped"

    @pytest.mark.static
    def test_every_tier_is_represented(self):
        """A tier with no package is a tier that is never exercised -- the
        site would render an empty section and the composition path would go
        untested."""
        kinds = {_kind(p.read_text(encoding="utf-8")) for p in PKGS}
        assert KINDS <= kinds, f"missing tiers: {sorted(KINDS - kinds)}"


class TestComposition:
    """Groups and Agents choose the combination, so a broken one is this
    index's bug rather than something to warn a user about after install."""

    def _composites(self):
        for path in PKGS:
            body = path.read_text(encoding="utf-8")
            if _kind(body) in ("group", "profile"):
                yield path, body

    @pytest.mark.static
    def test_members_declared(self):
        for path, body in self._composites():
            assert _members(body), f"{path.stem}: a composite needs members"

    @pytest.mark.static
    def test_members_exist(self):
        names = {p.stem for p in PKGS}
        for path, body in self._composites():
            for m, _, _b, _c in _members(body):
                assert m in names, f"{path.stem}: member {m!r} has no descriptor"

    @pytest.mark.static
    def test_members_are_plugins(self):
        """template.lua composes members by handing each one's tarball to
        `dsh plugin add`, and only a plugin has a tarball. A group nested
        inside another composite is expressed by expanding it (see
        tools/gen_agents.py), not by naming it here."""
        kind_of = {p.stem: _kind(p.read_text(encoding="utf-8")) for p in PKGS}
        for path, body in self._composites():
            for m, _, _b, _c in _members(body):
                assert kind_of[m] == "plugin", \
                    f"{path.stem}: member {m!r} is a {kind_of[m]}, not a plugin"

    @pytest.mark.static
    def test_member_bundle_names_match_their_descriptors(self):
        """A composite records each member's bundle name so it can remove it
        later. The profile manifest keys on that name, not on the descriptor
        name -- `dsh-annotation` is `@omdsh-dev/dsh-annotation` there -- and
        an uninstall that passed the wrong one failed partway through with
        ERR_PNPM_CANNOT_REMOVE_MISSING_DEPS, leaving the profile half
        dismantled."""
        body_of = {p.stem: p.read_text(encoding="utf-8") for p in PKGS}
        for path, body in self._composites():
            for name, version, bundle, _c in _members(body):
                want = _bundle_at(body_of[name], version)
                assert bundle == want, (
                    f"{path.stem}: member {name!r}@{version} recorded as "
                    f"{bundle!r} but its descriptor says {want!r} at that "
                    f"version")

    @pytest.mark.static
    def test_member_pins_match_the_member_descriptor(self):
        """A composite names one fixed set of bytes.

        Without a version its deps would resolve to whatever `latest` was that
        day, so `agent-tui-coding@0.1.0` would quietly mean something else
        after any member released. The pin is deliberately NOT `latest`: it is
        the newest version this index has actually mirrored, which lags
        upstream by however long publishing takes. What must hold is that the
        recorded version exists in the member's descriptor and that the commit
        recorded beside it is the one that descriptor declares.
        """
        declared = {}
        for path in PKGS:
            d = _dsh_block(path.read_text(encoding="utf-8"))
            declared[path.stem] = dict(
                re.findall(r'\["([^"]+)"\]\s*=\s*\{[^}]*commit = "([0-9a-f]{40})"', d))

        for path, body in self._composites():
            for name, version, _bundle, commit in _members(body):
                assert version in declared[name], (
                    f"{path.stem}: member {name!r} pinned at {version!r}, which "
                    f"its descriptor does not declare -- re-run gen_agents.py")
                assert commit == declared[name][version], (
                    f"{path.stem}: member {name}@{version} commit is stale")

    @pytest.mark.static
    def test_the_pinned_member_version_is_mirrored(self):
        """A group or an Agent is this index's reproducible unit. One whose
        members fetch from upstream at boot inherits every failure mode the
        mirror exists to remove -- no CN mirror, no checksum, and unusable if
        the repo is deleted -- while presenting itself as curated.

        The question is per VERSION, not per package. Asking it per package
        passed while an Agent pinned `dsh-cc-tui@0.3.3` and only `0.1.6` had
        a tarball: mirroring lags upstream by however long publishing takes,
        so "this package is mirrored" and "the version we pinned is mirrored"
        come apart every time a member releases.
        """
        mirrored = {}
        for p in PKGS:
            body = p.read_text(encoding="utf-8")
            m = re.search(r"mirror = \{(.*?)\n        \}", body, re.S)
            mirrored[p.stem] = set(
                re.findall(r'\["([^"]+)"\]\s*=\s*\{', m.group(1)) if m else [])

        for path, body in self._composites():
            for m, version, _b, _c in _members(body):
                assert version in mirrored[m], (
                    f"{path.stem}: member {m}@{version} has no mirrored "
                    f"tarball (mirrored: {sorted(mirrored[m]) or 'none'})")

    @pytest.mark.static
    def test_no_two_members_replace_the_same_base_row(self):
        """The pre-publish conflict gate.

        A bundle patch replaces the targeted row's whole config rather than
        merging into it, so two members owning the same dsh-base row means the
        later one silently wins and the earlier author's intent disappears.
        At install time that can only be a warning -- the user arranged it.
        Inside a group or an Agent the index arranged it, so it must not ship.

        Row ids come from tools/mine_overrides.py, which intersects each
        bundle's own cordis.patch.yml with dsh-base's row ids. Not hand-marked.
        """
        rows_of = {}
        for p in PKGS:
            d = _dsh_block(p.read_text(encoding="utf-8"))
            m = re.search(r"overrides = \{([^}]*)\}", d)
            rows_of[p.stem] = re.findall(r'"([^"]+)"', m.group(1)) if m else []

        for path, body in self._composites():
            owner = {}
            for member, _, _b, _c in _members(body):
                for row in rows_of.get(member, []):
                    assert row not in owner, (
                        f"{path.stem}: {member!r} and {owner[row]!r} both "
                        f"replace the dsh-base row {row!r}; the later member "
                        f"silently wins, so this combination cannot ship")
                    owner[row] = member

    @pytest.mark.static
    def test_generated_descriptors_match_their_source(self):
        """The flat member list is expanded from tools/agents.json. Committing
        an edit to the generated file instead of the source is how the two
        drift, so CI re-runs the expansion rather than trusting the diff."""
        import subprocess
        r = subprocess.run([sys.executable, str(ROOT / "tools" / "gen_agents.py"),
                            "--check"], capture_output=True, text=True, cwd=ROOT)
        assert r.returncode == 0, r.stdout + r.stderr


class TestAgent:
    @pytest.mark.static
    def test_agent_declares_its_profile(self):
        """An Agent IS a profile, so the name is part of what it is -- not
        something the index derived from its members or its own package name."""
        for path in PKGS:
            body = path.read_text(encoding="utf-8")
            if _kind(body) != "profile":
                continue
            assert _field(_dsh_block(body), "profile"), \
                f"{path.stem}: an Agent must declare dsh.profile"

    @pytest.mark.static
    def test_agent_profile_is_its_package_name(self):
        """`xlings install dsh:X` must be followed by `dsh --profile X`.

        Two names for one thing leaves a reader no way to know they are
        related -- installing `agent-web-coding` and then booting `coding`
        reads as a typo or a second package. Upstream documentation is the
        only thing that can license a different name, and these Agents are
        this index's own, so there is nothing to defer to.
        """
        for path in PKGS:
            body = path.read_text(encoding="utf-8")
            if _kind(body) != "profile":
                continue
            assert _field(_dsh_block(body), "profile") == path.stem, (
                f"{path.stem}: an Agent's profile must be its package name")

    @pytest.mark.static
    def test_agent_declares_a_surface(self):
        """An Agent must name the bundle that gives it a UI.

        `dsh plugin --profile <new> add` scaffolds with `@deepseek-ai/dsh-base`
        and nothing else, while dsh's own `web` profile carries
        `@deepseek-ai/dsh-web-app` beside it. Without a surface the Agent boots
        into a profile with no UI and every plugin that attaches to one waits
        forever -- `pending (waiting for service: webServer)`, then `1 entry
        did not activate`. Nothing earlier catches it: the members install, the
        manifest lists them, and `--dump-config` prints a correct tree, because
        none of those import anything.
        """
        for path in PKGS:
            body = path.read_text(encoding="utf-8")
            if _kind(body) != "profile":
                continue
            assert _field(_dsh_block(body), "surface"), \
                f"{path.stem}: an Agent must declare dsh.surface"

    @pytest.mark.static
    def test_group_declares_no_profile(self):
        """A group is a set of plugins, not a running thing. Naming a profile
        would imply booting it, which a group cannot do."""
        for path in PKGS:
            body = path.read_text(encoding="utf-8")
            if _kind(body) != "group":
                continue
            assert not _field(_dsh_block(body), "profile"), \
                f"{path.stem}: a group does not own a profile"

    @pytest.mark.static
    def test_agent_profile_names_do_not_collide(self):
        seen = {}
        for path in PKGS:
            body = path.read_text(encoding="utf-8")
            if _kind(body) != "profile":
                continue
            p = _field(_dsh_block(body), "profile")
            assert p not in seen, (
                f"{path.stem} and {seen[p]} both create profile {p!r}; "
                f"installing both would compose them into one")
            seen[p] = path.stem


class TestLicensePolicy:
    """Mirroring is redistribution -- the license is the gate, not a flag."""

    @pytest.mark.static
    def test_no_mirror_without_a_permissive_license(self, pkg):
        """`licenses` absent means upstream declares none, which grants no
        redistribution right -- so the check is fail-closed by construction."""
        _, body = pkg
        d = _dsh_block(body)
        if "mirror = {" not in d:
            return
        m = re.search(r'licenses\s*=\s*\{"([^"]+)"', body)
        lic = m.group(1) if m else None
        assert lic in MIRRORABLE, (
            f"license {lic!r} does not grant redistribution, so this package "
            f"must not carry a mirror block"
        )

    @pytest.mark.static
    def test_mirror_entries_carry_a_sha256(self, pkg):
        _, body = pkg
        d = _dsh_block(body)
        if "mirror = {" not in d:
            return
        i = d.index("mirror = {")
        assert d.count("sha256", i) >= 1, "every mirrored version needs a sha256"


class TestIsolation:
    @pytest.mark.isolation
    def test_no_shell_profile_writes(self, pkg):
        _, body = pkg
        for bad in (".bashrc", ".zshrc", "os.addenv", "os.setenv"):
            assert bad not in body, f"descriptors must not touch {bad}"

    @pytest.mark.isolation
    def test_no_direct_xvm_exec(self, pkg):
        _, body = pkg
        assert not re.search(r'os\.exec\w*\(\s*["\']xvm', body), \
            "xvm must be driven through the libxpkg API, not os.exec"


class TestTemplate:
    @pytest.mark.static
    def test_template_declares_both_architectures(self):
        t = (ROOT / "template.lua").read_text(encoding="utf-8")
        assert "package.dsh.mirror" in t, "template must branch on the mirror block"
        assert "GLOBAL" in t and "CN" in t, "mirrored versions need both mirrors"
        # The index no longer carries its own build opt-in: nothing it runs
        # executes upstream code any more -- `pnpm store add` only fetches --
        # and pnpm's allowBuilds already guards the compose step, which is
        # where a `prepare` script would actually run. A second gate here
        # would have been a weaker copy of that one.
        assert "DSH_ALLOW_BUILDS" not in t
        assert "allowBuilds" in t, "the real gate must still be pointed at"

    @pytest.mark.static
    def test_template_registers_xvm_as_group(self):
        """A plugin backs no executable; the default program kind would create
        a shim that always fails and doctor reports as an orphan."""
        t = (ROOT / "template.lua").read_text(encoding="utf-8")
        assert 'type = "group"' in t

    @pytest.mark.static
    def test_template_avoids_functions_the_hook_runtime_lacks(self):
        """The hook runtime is not xmake, and the gaps are silent.

        `os.files` is nil there: an Agent install crashed with `attempt to
        call a nil value (field 'files')` only after every member had already
        been composed, so the traceback pointed at the Agent rather than at
        the glob. `try` / `raise` / `cprintf` are the same class of gap in the
        plain-Lua index-build sandbox, where they cost the whole xpm section.
        """
        t = (ROOT / "template.lua").read_text(encoding="utf-8")
        body = "\n".join(l for l in t.splitlines() if not l.lstrip().startswith("--"))
        for missing in ("os.files(", "os.dirs(", "os.filedirs(",
                        "cprintf(", "raise(", "os.getwinsize("):
            assert missing not in body, (
                f"{missing} does not exist in the runtime that runs these hooks")
        assert not re.search(r"\btry\s*\{", body), \
            "xmake's try{} is nil in the libxpkg sandbox; use pcall"

    @pytest.mark.isolation
    def test_template_uses_only_libxpkg_imports(self):
        t = (ROOT / "template.lua").read_text(encoding="utf-8")
        for imp in re.findall(r'import\("([^"]+)"\)', t):
            assert imp.startswith("xim.libxpkg."), f"disallowed import: {imp}"


class TestSitePlugin:
    """The site plugin is the only place descriptors become user-visible, so
    its contract with the core is worth pinning down here."""

    @pytest.mark.static
    def test_facets_are_whitespace_joined_strings(self):
        """pkg.facets is Dict[str, str] and the core splits on whitespace.

        Assigning a list made every value render as its Python repr, so
        "['web-ui'," and "'session']" appeared as separate facet buttons on the
        home page. The plugin must join, and must drop values containing
        whitespace rather than let them split into two facets.
        """
        import importlib.util
        spec = importlib.util.spec_from_file_location(
            "dshplug", ROOT / ".xpkgindex" / "plugins" / "dsh.py")
        mod = importlib.util.module_from_spec(spec)
        spec.loader.exec_module(mod)

        assert mod._facet_value(["a", "b", "a"]) == "a b", "join and dedupe"
        assert mod._facet_value(["ok", "not ok"]) == "ok", "drop spaced values"
        assert mod._facet_value(["a", "b", "c"], limit=2) == "a b"
        assert mod._facet_value([]) == ""
        for v in mod._facet_value(["x", "y"]).split():
            assert "[" not in v and "'" not in v, "no python repr leakage"


class TestProfileResolution:
    """Profile naming follows upstream, and this index adds nothing to it.

    Upstream's model: the name is the user's. `dsh plugin --profile <name>`
    creates whatever you pass, and their docs pick `demo`, `cc-tui`, anything.
    Two earlier rules here -- naming a surface plugin's profile after itself,
    and deriving one from the current subos -- each looked reasonable and
    together made every profile name in every upstream document wrong under
    this index. A user following dsh-cc-tui's own README got "profile does not
    exist" twice.
    """

    @pytest.mark.static
    def test_resolution_order_is_override_then_declared_then_web(self):
        t = (ROOT / "template.lua").read_text(encoding="utf-8")
        body = t[t.index("local function profile()"):]
        body = body[:body.index("\nend")]
        assert 'os.getenv("XIM_DSH_PROFILE")' in body
        assert "package.dsh.profile" in body
        assert '"web"' in body
        # No invented sources: not the subos, not the package name.
        assert "subos" not in body.lower(), "the subos is not a profile name"
        assert "package.name" not in body, "a plugin does not name its profile"

    @pytest.mark.static
    def test_the_override_does_not_impersonate_an_upstream_variable(self):
        """dsh reads DSH_HOME, DSH_WEB_URL and DSH_TELEMETRY_DISABLED, and
        nothing else -- there is no DSH_PROFILE anywhere in its tree. Naming
        ours that would claim an upstream contract that does not exist, and
        would collide the day upstream defines it to mean something else."""
        t = (ROOT / "template.lua").read_text(encoding="utf-8")
        assert 'os.getenv("DSH_PROFILE")' not in t
        assert "XIM_DSH_PROFILE" in t

    @pytest.mark.static
    def test_no_xlings_env_var_is_read(self):
        """An earlier version read `XLINGS_SUBOS`, which xlings does not set,
        so the branch was dead code while the docs claimed it worked."""
        t = (ROOT / "template.lua").read_text(encoding="utf-8")
        assert 'os.getenv("XLINGS' not in t

    @pytest.mark.static
    def test_every_plugin_records_the_profile_its_readme_documents(self):
        """The name is upstream's to choose, so it is recorded rather than
        derived -- and recorded even when it equals the `web` fallback, so
        "upstream says web" stays distinguishable from "upstream says nothing"."""
        for path in PKGS:
            body = path.read_text(encoding="utf-8")
            d = _dsh_block(body)
            if _field(d, "kind") != "plugin":
                continue
            assert _field(d, "profile"), f"{path.stem}: dsh.profile required"

    @pytest.mark.static
    def test_an_agent_gets_a_command_named_after_the_package(self):
        """Installing an Agent should leave you a command you can type.

        `xvm.add(<package>, { alias = "dsh --profile <package>" })` gives that
        for free, and because the name is xvm's it is versioned and per-subos:
        two versions of one Agent coexist and `xlings use` switches between
        them. A plugin and a group keep `type = "group"` -- neither backs an
        executable, and the default program kind would leave a shim that
        always fails plus an orphan in `self doctor`.
        """
        t = (ROOT / "template.lua").read_text(encoding="utf-8")
        assert 'alias = "dsh --profile "' in t, \
            "an Agent must register a command alias onto its profile"
        assert 'type = "group"' in t, \
            "a plugin and a group must stay shim-less"

    @pytest.mark.static
    def test_a_plugin_registers_itself_into_no_profile(self):
        """Fetching and composing are separate acts with separate owners.

        While the atom registered itself, installing one Agent also put its
        five members into `web`, because each member had already decided
        where it belonged before the Agent ran. Only a composite -- or the
        user pasting the printed command -- may write to a profile.
        """
        t = (ROOT / "template.lua").read_text(encoding="utf-8")
        body = t[t.index("local function config_plugin()"):]
        body = body[:body.index("local function config_group()")]
        assert "system.exec" not in body, \
            "a plugin's config must not run a command against a profile"
        assert "dsh plugin --profile" in body, \
            "it must still print the exact command to paste"

    @pytest.mark.static
    def test_install_prints_upstreams_own_launch_command(self):
        """`dsh web` is how upstream spells the web profile; anything else is
        `--profile <name>`. The user should be able to copy what is printed."""
        t = (ROOT / "template.lua").read_text(encoding="utf-8")
        assert '"dsh web"' in t
        assert '"dsh --profile "' in t
        assert "log.info" in t



class TestAffected:
    """The script that decides whether the boot gate runs at all.

    It is the one piece of CI that can turn the gate off, so it gets tested
    like a gate rather than like a helper: every case below is a way the boot
    could be skipped on a change that needed it.
    """

    def _known(self):
        sys.path.insert(0, str(ROOT / "tools"))
        import affected
        return affected, affected.descriptors(ROOT)

    @pytest.mark.static
    def test_a_changed_member_boots_its_composites(self):
        """Composites pin each member's version AND commit. Touching a member
        can invalidate the composition, and only a boot proves those bytes
        still start together."""
        affected, known = self._known()
        member = next(m for d in known.values() for m in d["members"])
        got = {u["name"] for u in
               affected.affected([f"pkgs/x/{member}.lua"], known)["units"]}
        owners = {n for n, d in known.items() if member in d["members"]}
        assert member in got, "the changed plugin must boot itself"
        assert owners <= got, f"{owners - got} name {member} but were not booted"

    @pytest.mark.static
    def test_infrastructure_forces_a_full_run(self):
        """template.lua is appended to every descriptor at index-build time;
        pkgindex-build.lua decides whether an index builds at all."""
        affected, known = self._known()
        for path in ("template.lua", "pkgindex-build.lua", "tools/bootcheck.py",
                     "tests/test_descriptors.py", ".github/workflows/ci.yml"):
            r = affected.affected([path], known)
            assert r["full"], f"{path} must force a full run"
            assert r["any"]

    @pytest.mark.static
    def test_an_unclassified_path_fails_open(self):
        """Being slow is recoverable. Silently skipping the gate on a change
        nobody thought to classify is not."""
        affected, known = self._known()
        assert affected.affected(["Makefile"], known)["full"]
        assert affected.affected(["some/new/thing.toml"], known)["full"]

    @pytest.mark.static
    def test_documentation_boots_nothing(self):
        affected, known = self._known()
        r = affected.affected(
            ["README.md", ".agents/docs/x.md", "site/index.html", "LICENSE"],
            known)
        assert not r["any"] and not r["full"], r

    @pytest.mark.static
    def test_a_full_run_covers_every_composite(self):
        """The floor is what the gate booted before this change existed."""
        affected, known = self._known()
        got = {u["name"] for u in affected.affected([], known, full=True)["units"]}
        want = {n for n, d in known.items() if d["kind"] in ("group", "profile")}
        assert got == want

    @pytest.mark.static
    def test_a_deleted_descriptor_does_not_crash(self):
        affected, known = self._known()
        assert affected.affected(["pkgs/z/never-existed.lua"], known)["units"] == []

    @pytest.mark.static
    def test_every_plugin_resolves_to_a_surface(self):
        """`dsh.profile` is a profile NAME, not a surface -- it records where
        a plugin's own README says to install it, and an author may call that
        anything. The first scan at ten stars brought in `qqbot`, `multica`,
        `hello` and `headless`, so a table lookup that failed on an
        unrecognised name blocked forty working packages over four labels.
        Every profile now resolves; only the names that genuinely imply a
        different surface are listed."""
        affected, known = self._known()
        for name, d in known.items():
            if d["kind"] != "plugin":
                continue
            spec = affected.surface_for(d["profile"])
            assert ("bundle" in spec) ^ ("package" in spec), (name, d["profile"])

class TestDiscoverErrorSemantics:
    """"Not there" and "could not ask" must never be the same answer.

    `--audit` reads a None from gh_json as "this pinned commit is GONE" and
    fails the run, which per discover.py's own docstring means a force push, a
    rewritten history or a deleted repo. The version before this suite returned
    None for a rate limit, a 5xx and a dropped connection too, so one exhausted
    budget would have reported every upstream in the index as force-pushed at
    once, unattended, on the nightly schedule.
    """

    def _discover(self, monkeypatch, rc, stdout="", stderr=""):
        sys.path.insert(0, str(ROOT / "tools"))
        import discover

        class R:
            returncode, stdout, stderr = rc, "", ""
        R.stdout, R.stderr = stdout, stderr
        monkeypatch.setattr(discover.subprocess, "run",
                            lambda *a, **k: R())
        return discover

    @pytest.mark.static
    def test_a_vanished_commit_reads_as_missing(self, monkeypatch):
        """422, not 404. A sha that no longer exists in a repo that does
        answers `No commit found for SHA` with 422 -- measured against this
        repo. Trusting 404 alone turns every real audit hit into a crash."""
        d = self._discover(monkeypatch, 1, stderr=
                           "gh: No commit found for SHA: dead (HTTP 422)")
        assert d.gh_json("repos/x/y/commits/dead") is None

    @pytest.mark.static
    def test_a_deleted_repo_reads_as_missing(self, monkeypatch):
        d = self._discover(monkeypatch, 1, stderr="gh: Not Found (HTTP 404)")
        assert d.gh_json("repos/x/gone") is None

    @pytest.mark.static
    def test_a_rate_limit_is_not_a_missing_pin(self, monkeypatch):
        d = self._discover(monkeypatch, 1, stderr=
                           "gh: API rate limit exceeded (HTTP 403)")
        with pytest.raises(Exception) as e:
            d.gh_json("repos/x/y/commits/abc")
        assert "403" in str(e.value)

    @pytest.mark.static
    def test_a_server_fault_is_not_a_missing_pin(self, monkeypatch):
        d = self._discover(monkeypatch, 1, stderr="gh: Bad gateway (HTTP 502)")
        with pytest.raises(Exception):
            d.gh_json("repos/x/y")

    @pytest.mark.static
    def test_gh_failing_to_run_is_not_a_missing_pin(self, monkeypatch):
        """No status at all -- gh absent, DNS gone, connection refused."""
        d = self._discover(monkeypatch, 1, stderr="dial tcp: no such host")
        with pytest.raises(Exception):
            d.gh_json("repos/x/y")

    @pytest.mark.static
    def test_a_good_answer_is_parsed(self, monkeypatch):
        d = self._discover(monkeypatch, 0, stdout='{"sha": "abc"}')
        assert d.gh_json("repos/x/y")["sha"] == "abc"

    @pytest.mark.static
    def test_an_exhausted_budget_refuses_to_start(self, monkeypatch):
        d = self._discover(monkeypatch, 0, stdout=json.dumps(
            {"resources": {"core": {"limit": 1000, "remaining": 3,
                                    "reset": 0, "used": 997}}}))
        with pytest.raises(Exception) as e:
            d.rate_check(500, "--audit")
        assert "Refusing to start" in str(e.value)

class TestAffectedCap:
    """A run may not ask for a matrix GitHub will refuse.

    `discover --new` proposed 358 packages in one PR on 2026-08-15. GitHub
    caps a matrix at 256 jobs and does not degrade past it: the boot job never
    starts, and the gate fails with a cause that appears nowhere in the logs.
    """

    def _mod(self):
        sys.path.insert(0, str(ROOT / "tools"))
        import affected
        return affected

    @pytest.mark.static
    def test_too_many_units_refuses_rather_than_sampling(self):
        affected = self._mod()
        known = {f"p{i}": {"kind": "plugin", "profile": "web", "members": []}
                 for i in range(affected.MAX_UNITS + 1)}
        with pytest.raises(affected.TooManyUnits) as e:
            affected.affected(
                [f"pkgs/p/p{i}.lua" for i in range(affected.MAX_UNITS + 1)], known)
        assert "ci:full" in str(e.value), "the message must name the escape hatch"

    @pytest.mark.static
    def test_exactly_the_ceiling_is_allowed(self):
        affected = self._mod()
        known = {f"p{i}": {"kind": "plugin", "profile": "web", "members": []}
                 for i in range(affected.MAX_UNITS)}
        r = affected.affected(
            [f"pkgs/p/p{i}.lua" for i in range(affected.MAX_UNITS)], known)
        assert len(r["units"]) == affected.MAX_UNITS

    @pytest.mark.static
    def test_a_full_run_is_never_capped(self):
        """A full run is bounded by the composite count, not by the diff --
        the one path that must keep working no matter how big the change."""
        affected = self._mod()
        known = {f"p{i}": {"kind": "plugin", "profile": "web", "members": []}
                 for i in range(affected.MAX_UNITS * 3)}
        known["a"] = {"kind": "profile", "profile": "a", "members": []}
        r = affected.affected([f"pkgs/p/p{i}.lua" for i in range(200)],
                              known, full=True)
        assert r["units"] == [{"name": "a", "kind": "profile",
                               "composite": True, "install": "a"}]

    @pytest.mark.static
    def test_the_ceiling_is_under_githubs_matrix_limit(self):
        assert self._mod().MAX_UNITS < 256

    @pytest.mark.static
    def test_the_ceiling_clears_a_real_discovery_batch(self):
        """The cap exists to catch a runaway, not to block routine work. The
        first scan after the star bar rose to 10 found 41 packages and the
        ceiling was 40 -- a cap a normal batch trips is mis-calibrated, and
        the failure it produces teaches the reader to raise it rather than to
        look at what changed."""
        assert self._mod().MAX_UNITS >= 60

class TestAffectedOnRealAutomationDiffs:
    """The shapes discover.yml actually produces.

    Both automated PRs carry a generated data file next to their descriptors.
    Treating those as infrastructure made every discover PR a "full run" --
    three composites booted and none of the packages the PR added, which is
    exactly the failure the scoping exists to end. Measured on PR #18, whose
    22 bumped descriptors were classified `full run (tools/npm.json)`.
    """

    def _mod(self):
        sys.path.insert(0, str(ROOT / "tools"))
        import affected
        return affected

    @pytest.mark.static
    def test_a_bump_pr_boots_the_bumped_packages(self):
        affected = self._mod()
        known = affected.descriptors(ROOT)
        name = next(n for n, d in known.items() if d["kind"] == "plugin")
        r = affected.affected([f"pkgs/x/{name}.lua", "tools/npm.json"], known)
        assert not r["full"], r["reason"]
        assert name in {u["name"] for u in r["units"]}

    @pytest.mark.static
    def test_a_new_plugins_pr_boots_the_new_packages(self):
        affected = self._mod()
        known = affected.descriptors(ROOT)
        name = next(n for n, d in known.items() if d["kind"] == "plugin")
        r = affected.affected([f"pkgs/x/{name}.lua", "tools/profiles.json"], known)
        assert not r["full"], r["reason"]
        assert name in {u["name"] for u in r["units"]}

    @pytest.mark.static
    def test_a_data_file_alone_boots_nothing(self):
        affected = self._mod()
        known = affected.descriptors(ROOT)
        r = affected.affected(["tools/npm.json", "tools/profiles.json"], known)
        assert not r["any"] and not r["full"], r

    @pytest.mark.static
    def test_tool_code_still_forces_a_full_run(self):
        """The exemption is for data, not for the scripts that read it."""
        affected = self._mod()
        known = affected.descriptors(ROOT)
        for path in ("tools/check_npm.py", "tools/add_kind.py",
                     "tools/gen_agents.py", "tools/sync.py"):
            assert affected.affected([path], known)["full"], path

class TestBootcheckSpec:
    """Booting an un-mirrored version is the normal case, not a fallback.

    `mirror` blocks are written by tools/mirror.py only after a licence check,
    so every descriptor `discover` proposes -- and every version it bumps to --
    arrives un-mirrored by design. Requiring a store tarball left the gate
    hollow for exactly those PRs: on PR #18 all 22 bumped packages failed with
    "no installed tarball" while the three composites, which pin mirrored
    versions, passed.
    """

    def _mod(self, monkeypatch):
        sys.path.insert(0, str(ROOT / "tools"))
        import bootcheck
        monkeypatch.setattr(bootcheck.glob, "glob", lambda *a, **k: [])
        return bootcheck

    @pytest.mark.static
    def test_an_unmirrored_version_installs_from_its_pin(self, monkeypatch):
        bc = self._mod(monkeypatch)
        for path in PKGS:
            body = path.read_text(encoding="utf-8")
            if _kind(body) != "plugin":
                continue
            latest = _field(_dsh_block(body), "latest")
            got = bc.spec(path.stem, latest)
            assert got.startswith("github:"), got
            assert re.fullmatch(r"github:[^/]+/[^#]+#[0-9a-f]{40}", got), got

    @pytest.mark.static
    def test_a_version_with_no_pin_is_refused(self, monkeypatch):
        """Better a named failure than a spec that installs the wrong bytes."""
        bc = self._mod(monkeypatch)
        name = next(p.stem for p in PKGS if _kind(p.read_text()) == "plugin")
        with pytest.raises(SystemExit) as e:
            bc.spec(name, "0.0.0-not-a-declared-version")
        assert "not mirrored" in str(e.value)

    @pytest.mark.static
    def test_install_resolves_the_mirror_per_version(self):
        """Mirroring is a licence answer given one tarball at a time.

        tools/mirror.py publishes a version only after verifying that
        version's tarball, so a package routinely carries a `mirror` block for
        0.1.0 while a freshly bumped 0.6.0 has no entry yet. A package-level
        `if not MIRROR` took the mirrored branch for that package and then
        indexed a nil -- which was every package for the whole window between
        a bump landing and the mirror pipeline running. Reproduced against
        dsh-at-file@0.6.0: `install hook failed: attempt to index a nil value`.
        """
        t = (ROOT / "template.lua").read_text(encoding="utf-8")
        body = t[t.index("function install()"):]
        body = body[:body.index("\n-- Warn when this package replaces")]
        assert "MIRROR[pkginfo.version()].tarball" not in body, \
            "install() must not index MIRROR without checking this version"
        assert "MIRROR and MIRROR[pkginfo.version()]" in body, \
            "install() must resolve the mirror entry for the version it installs"

class TestDiscoveryBar:
    """The star bar gates the robot, never a contributor.

    A human opening a PR for their own package has already supplied the signal
    a star count is a proxy for. If the bar ever leaked into the descriptor
    contract, a PR for a brand-new project would become unmergeable for a
    reason that has nothing to do with whether the package works.
    """

    @pytest.mark.static
    def test_the_bar_is_ten_inclusive(self):
        """Ten stars is in, nine is out."""
        sys.path.insert(0, str(ROOT / "tools"))
        import discover
        assert discover.MIN_STARS == 10, (
            "the unattended scan proposed 358 packages at MIN_STARS=2 once the "
            "topic reached 800 repos")
        assert discover.enough_stars(10), "ten stars must pass"
        assert not discover.enough_stars(9), "nine must not"
        assert not discover.enough_stars(None), "an absent count is not a pass"

    @pytest.mark.static
    def test_stars_are_not_part_of_the_descriptor_contract(self, pkg):
        """The scan's triage heuristic must not become a schema field: a
        descriptor that recorded stars would go stale the day it landed, and
        would invite a check that blocks human PRs."""
        from xpkgindex.readers.xpkg_lua import read_file

        path, _ = pkg
        parsed = read_file(str(path), str(ROOT))
        assert parsed is not None, f"not a package descriptor: {path}"
        # Check Lua table keys, not prose, comments, or repository owners such
        # as starslittle. The index's existing reader handles Lua quoting.
        pending = [parsed.raw]
        while pending:
            value = pending.pop()
            if isinstance(value, dict):
                assert not any(isinstance(key, str) and "stars" in key
                               for key in value), \
                    "a star count is scan-time triage, not a property of the package"
                pending.extend(value.values())
            elif isinstance(value, list):
                pending.extend(value)

    @pytest.mark.static
    @pytest.mark.parametrize("fields", [
        'repo = "https://github.com/starslittle/dsh-queue-plus",',
        'description = "stars = 12 is not package metadata here",',
        'description = [[stars = 12]],',
        '-- stars = 12\n description = "a package",',
        '--[=[ stars = 12 ]=]\n description = "a package",',
    ])
    def test_count_mentions_in_values_and_comments_are_allowed(self, tmp_path, fields):
        path = tmp_path / "example.lua"
        body = 'package = { name = "example", ' + fields + ' }'
        path.write_text(body, encoding="utf-8")
        self.test_stars_are_not_part_of_the_descriptor_contract((path, body))

    @pytest.mark.static
    @pytest.mark.parametrize("fields", [
        'stars = 12,',
        'stars_count = 12,',
        'min_stars = 10,',
        'dsh = { github_stars = 12 },',
        '["stars"] = 12,',
        "['stars'] = false,",
        'dsh = { stars = 12 },',
        'dsh = { versions = { { ["stars"] = 0 } } },',
    ])
    def test_count_fields_are_rejected(self, tmp_path, fields):
        path = tmp_path / "example.lua"
        body = 'package = { name = "example", ' + fields + ' }'
        path.write_text(body, encoding="utf-8")
        with pytest.raises(AssertionError, match="scan-time triage"):
            self.test_stars_are_not_part_of_the_descriptor_contract((path, body))

class TestAuditMirrorPolicy:
    """A vanished upstream is two events, and they need opposite answers.

    Mirrored: this index already holds those exact bytes under a sha256 in
    xlings-res, `xlings install dsh:<pkg>` keeps working, and nobody
    downstream notices. Un-mirrored: the descriptor is a pointer at a repo
    that no longer exists, so it promises bytes nobody can fetch and the only
    honest fix is removal.
    """

    def _mod(self):
        sys.path.insert(0, str(ROOT / "tools"))
        import discover
        return discover

    @pytest.mark.static
    def test_carried_reports_whether_the_pinned_version_is_mirrored(self):
        d = self._mod()
        have = d.carried()
        assert have, "no plugins read"
        assert all("mirrored" in v for v in have.values())
        # The flag must track the pinned version, not merely the presence of a
        # mirror block: a package mirrored at 0.1.0 and bumped to 0.6.0 is not
        # mirrored at the version it now serves.
        for name, v in have.items():
            body = next(p for p in PKGS if p.stem == name).read_text()
            block = _dsh_block(body)
            mb = re.search(r"mirror = \{(.*?)\n        \}", block, re.S)
            want = bool(mb and f'["{v["version"]}"]' in mb.group(1))
            assert v["mirrored"] is want, name

    @pytest.mark.static
    def test_a_mirrored_pin_survives_its_upstream(self, monkeypatch):
        d = self._mod()
        monkeypatch.setattr(d, "carried", lambda: {
            "keeper": {"repo": "x/gone", "bundle": "", "version": "0.1.0",
                       "commit": "a" * 40, "mirrored": True}})
        monkeypatch.setattr(d, "rate_check", lambda *a, **k: None)
        monkeypatch.setattr(d, "gh_json", lambda p: None)
        rows = d.mode_audit()
        assert rows[0]["mirrored"] is True
        assert "keep" in rows[0]["verdict"]

    @pytest.mark.static
    def test_an_unmirrored_pin_is_marked_for_removal(self, monkeypatch):
        d = self._mod()
        monkeypatch.setattr(d, "carried", lambda: {
            "doomed": {"repo": "x/gone", "bundle": "", "version": "0.1.0",
                       "commit": "a" * 40, "mirrored": False}})
        monkeypatch.setattr(d, "rate_check", lambda *a, **k: None)
        monkeypatch.setattr(d, "gh_json", lambda p: None)
        rows = d.mode_audit()
        assert rows[0]["mirrored"] is False
        assert "REMOVE" in rows[0]["verdict"]

class TestUpstreamChanges:
    """`dsh.upstream` records what happened to a package's origin.

    A deleted or renamed upstream does not make the package worthless -- if the
    version is mirrored, the bytes are still here and still install. What it
    does make worthless is the `repo` link at the top of the page, so the page
    says so at the bottom instead of the index quietly dropping a working
    package or leaving a reader to discover a 404 for themselves.
    """

    EVENTS = {"gone", "renamed", "archived", "moved"}

    def _entries(self, body: str):
        d = _dsh_block(body)
        m = re.search(r"upstream = \{(.*?)\n        \}", d, re.S)
        if not m:
            return []
        return re.findall(r'date = "([^"]*)", event = "([^"]*)"', m.group(1))

    @pytest.mark.static
    def test_every_entry_is_dated_and_named(self, pkg):
        _, body = pkg
        for date, event in self._entries(body):
            assert re.fullmatch(r"\d{4}-\d{2}-\d{2}", date), \
                f"an undated upstream change cannot be read in order: {date!r}"
            assert event in self.EVENTS, \
                f"unknown upstream event {event!r}; known: {sorted(self.EVENTS)}"

    @pytest.mark.static
    def test_every_entry_carries_a_note(self, pkg):
        """The event word alone is a label. What a reader needs is what it
        means for them -- whether it still installs, and what they lose."""
        path, body = pkg
        d = _dsh_block(body)
        m = re.search(r"upstream = \{(.*?)\n        \}", d, re.S)
        if not m:
            return
        for entry in re.findall(r"\{(.*?)\}", m.group(1), re.S):
            assert "note =" in entry, f"{path.stem}: an upstream entry with no note"

    @pytest.mark.static
    def test_a_gone_upstream_is_only_kept_when_mirrored(self, pkg):
        """The policy, enforced rather than remembered: an un-mirrored package
        whose upstream vanished promises bytes nobody can fetch, so it must be
        removed, not annotated."""
        path, body = pkg
        if not any(e == "gone" for _, e in self._entries(body)):
            return
        d = _dsh_block(body)
        latest = _field(d, "latest")
        mb = re.search(r"mirror = \{(.*?)\n        \}", d, re.S)
        assert mb and f'["{latest}"]' in mb.group(1), (
            f"{path.stem}: upstream is gone and {latest} is not mirrored -- "
            f"this descriptor promises bytes nobody can fetch and must be "
            f"removed instead")

class TestPerVersionBundleName:
    """The manifest name belongs to a version, not to a package.

    Upstream renames its npm package. `dsh-cc-tui` shipped under that name
    through 0.3.3 and became `@deepseek-harness-tui/dsh-tui` at 0.5.0 -- so a
    composite pinning 0.3.3 must still record `dsh-cc-tui`, because that is
    what `dsh plugin remove` will look for in the profile manifest, while the
    package page must show the new name for `latest`.

    Third time this index has had to make the same correction: the mirror
    lookup in gen_agents, install() in template.lua (#21), and now this.
    """

    @pytest.mark.static
    def test_bundle_name_describes_latest(self, pkg):
        _, body = pkg
        d = _dsh_block(body)
        latest = _field(d, "latest")
        declared = _field(d, "bundle_name")
        if declared is None:
            return                       # groups and Agents carry no bundle
        assert _bundle_at(body, latest) == declared, (
            "bundle_name must be the name `latest` publishes under; an older "
            "version that differs declares its own `bundle` inline")

    @pytest.mark.static
    def test_an_override_only_appears_on_a_declared_version(self, pkg):
        path, body = pkg
        d = _dsh_block(body)
        vblock = re.search(r"versions = \{(.*?)\n        \}", d, re.S)
        if not vblock:
            return
        for ver in re.findall(r'\["([^"]+)"\]\s*=\s*\{[^}]*bundle = "', vblock.group(1)):
            assert f'["{ver}"]' in vblock.group(1), f"{path.stem}: {ver}"

    @pytest.mark.static
    def test_the_resolver_prefers_the_version_over_the_default(self):
        body = '''package = { dsh = {
            bundle_name = "@new/name",
            versions = {
                ["0.3.3"] = { commit = "aa", bundle = "old-name" },
                ["0.5.0"] = { commit = "bb" },
            },
            latest = "0.5.0",
        }, }'''
        assert _bundle_at(body, "0.3.3") == "old-name"
        assert _bundle_at(body, "0.5.0") == "@new/name"
        assert _bundle_at(body, "9.9.9") == "@new/name"

class TestSurfaceResolution:
    """The surface a lone plugin boots on is named, and names change.

    `dsh-cc-tui` became `@deepseek-harness-tui/dsh-tui` at 0.5.0. A hardcoded
    surface string made bootcheck declare a bundle nothing provided, and dsh
    answered `cannot resolve profile bundle "dsh-cc-tui"` -- the fourth time
    this index answered a per-VERSION question with a per-PACKAGE constant.
    """

    def _mods(self):
        sys.path.insert(0, str(ROOT / "tools"))
        import affected, bootcheck
        return affected, bootcheck

    @pytest.mark.static
    def test_a_surface_is_either_shipped_or_a_package_here(self):
        affected, _ = self._mods()
        specs = dict(affected.SURFACE_FOR_PROFILE)
        specs["<default>"] = affected.DEFAULT_SURFACE
        for profile, spec in specs.items():
            assert isinstance(spec, dict), profile
            assert ("bundle" in spec) ^ ("package" in spec), (
                f"{profile}: a surface either ships inside dsh (bundle) or is "
                f"a package this index installs (package), never both")

    @pytest.mark.static
    def test_an_unrecognised_profile_name_still_resolves(self):
        """A profile name an author invented is not an authoring error."""
        affected, _ = self._mods()
        for made_up in ("qqbot", "multica", "hello", "headless", ""):
            assert affected.surface_for(made_up) == affected.DEFAULT_SURFACE

    @pytest.mark.static
    def test_a_surface_package_exists_and_is_carried(self):
        affected, _ = self._mods()
        names = {p.stem for p in PKGS}
        for profile, spec in affected.SURFACE_FOR_PROFILE.items():
            if "package" in spec:
                assert spec["package"] in names, \
                    f"{profile} names a surface package this index does not carry"

    @pytest.mark.static
    def test_the_surface_name_is_read_from_the_descriptor(self):
        """Not a constant. Whatever the surface package calls itself at the
        version being installed is what the profile manifest must declare."""
        affected, bootcheck = self._mods()
        for profile, spec in affected.SURFACE_FOR_PROFILE.items():
            if "package" not in spec:
                continue
            pkg = spec["package"]
            body = next(p for p in PKGS if p.stem == pkg).read_text()
            latest = _field(_dsh_block(body), "latest")
            assert bootcheck.bundle_at(pkg, latest) == _bundle_at(body, latest)

    @pytest.mark.static
    def test_bundle_at_falls_back_to_the_default(self):
        _, bootcheck = self._mods()
        name = next(p.stem for p in PKGS if _kind(p.read_text()) == "plugin")
        body = next(p for p in PKGS if p.stem == name).read_text()
        declared = _field(_dsh_block(body), "bundle_name")
        assert bootcheck.bundle_at(name, "9.9.9-undeclared") == declared
