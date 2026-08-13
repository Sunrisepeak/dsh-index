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
    def test_bundle_name_and_origin(self, pkg):
        _, body = pkg
        d = _dsh_block(body)
        assert _field(d, "bundle_name"), "bundle_name required"
        origin = _field(d, "origin")
        assert origin and "/" in origin, "origin must be owner/repo"

    @pytest.mark.static
    def test_pinned_sha_is_40_hex(self, pkg):
        """github sources must pin an immutable commit.

        Package NAMES are not trustworthy here: 36 community repos name
        themselves into the `@deepseek-ai/` scope that DeepSeek owns on npm,
        so a bare name can silently resolve to different code later.
        """
        _, body = pkg
        d = _dsh_block(body)
        if _field(d, "source") != "github":
            return
        refs = re.findall(r'ref\s*=\s*"([^"]*)"', d)
        assert refs, "github source must pin at least one ref"
        for r in refs:
            assert SHA_RE.match(r), f"ref must be a 40-hex commit sha, got {r!r}"

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
    def test_license_recorded(self, pkg):
        _, body = pkg
        assert _field(_dsh_block(body), "license"), \
            "dsh.license required; it decides mirror eligibility"

    @pytest.mark.static
    def test_no_mirror_without_a_permissive_license(self, pkg):
        _, body = pkg
        d = _dsh_block(body)
        if "mirror = {" not in d:
            return
        lic = _field(d, "license")
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
