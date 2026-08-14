"""Schema and policy checks over every descriptor in pkgs/.

Descriptors here are DATA ONLY -- `type`, `xpm` and the four lifecycle hooks
come from template.lua, appended at index-build time. So these tests check the
data contract, and tests/libxpkg_sandbox_harness.lua checks that the append
still works under the runtime that actually performs it.
"""
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
        bundle_of = {p.stem: _field(_dsh_block(p.read_text(encoding="utf-8")),
                                    "bundle_name") for p in PKGS}
        for path, body in self._composites():
            for name, _v, bundle, _c in _members(body):
                assert bundle == bundle_of[name], (
                    f"{path.stem}: member {name!r} recorded as {bundle!r} but "
                    f"its descriptor says {bundle_of[name]!r}")

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


