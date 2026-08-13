"""Schema and policy checks over every descriptor in pkgs/.

Descriptors here are DATA ONLY -- `type`, `xpm` and the four lifecycle hooks
come from template.lua, appended at index-build time. So these tests check the
data contract, and tests/libxpkg_sandbox_harness.lua checks that the append
still works under the runtime that actually performs it.
"""
import pathlib
import re

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
        _, body = pkg
        assert _field(_dsh_block(body), "bundle_name"), "bundle_name required"

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
        assert "DSH_ALLOW_BUILDS" in t, "un-mirrored prepare scripts need opt-in"

    @pytest.mark.static
    def test_template_registers_xvm_as_group(self):
        """A plugin backs no executable; the default program kind would create
        a shim that always fails and doctor reports as an orphan."""
        t = (ROOT / "template.lua").read_text(encoding="utf-8")
        assert 'type = "group"' in t

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
    """The profile a plugin lands in is the one fact a user must not have to
    guess -- and the resolution chain reads environment variables, which is
    exactly where an unverified name turns into dead code."""

    @pytest.mark.static
    def test_subos_comes_from_the_api_not_the_environment(self):
        """An earlier version read `XLINGS_SUBOS`, which xlings does not set --
        the branch was dead code while the docs claimed it worked.

        The fix is not a better variable name: libxpkg answers this directly
        with system.subos_sysrootdir(), so no XLINGS_* variable should be read
        at all. An answer from the toolchain beats one inferred from whatever
        happens to be exported into the shell.
        """
        t = (ROOT / "template.lua").read_text(encoding="utf-8")
        assert "XLINGS_" not in t.replace("XLINGS_SUBOS`", "").replace(
            "XLINGS_SUBOS_LIB", ""), "no XLINGS_* env var should be read"
        assert "system.subos_sysrootdir" in t

    @pytest.mark.static
    def test_new_libxpkg_modules_are_feature_detected(self):
        """`if system.x then` is true on every client whether or not the
        function exists -- the spec calls this out explicitly."""
        t = (ROOT / "template.lua").read_text(encoding="utf-8")
        assert 'type(system.subos_sysrootdir) ~= "function"' in t

    @pytest.mark.static
    def test_current_symlink_is_not_used_as_a_profile_name(self):
        """`subos/current` is a symlink to the active subos, so a profile named
        after it would follow the symlink instead of staying put."""
        t = (ROOT / "template.lua").read_text(encoding="utf-8")
        assert '"current"' in t

    @pytest.mark.static
    def test_install_reports_the_profile(self):
        """`dsh --profile <plugin-name>` is the natural guess and always fails."""
        t = (ROOT / "template.lua").read_text(encoding="utf-8")
        assert "dsh --profile" in t and "log.info" in t
