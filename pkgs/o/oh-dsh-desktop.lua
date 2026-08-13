package = {
    spec = "1",

    name = "oh-dsh-desktop",
    description = "Extensible macOS workbench for DeepSeek Harness with a native PTY, workspace tools, live bilingual plugins, an",
    repo = "https://github.com/hust-open-atom-club/oh-dsh-desktop",
    homepage = "https://github.com/hust-open-atom-club/oh-dsh-desktop",
    licenses = {"BSD-3-Clause"},
    authors = {"hust-open-atom-club"},

    status = "dev",
    categories = {"dsh-plugin", "desktop"},
    keywords = {"dsh", "desktop"},

    dsh = {
        bundle_name = "@oh-dsh/desktop",
        source = "github",
        origin = "hust-open-atom-club/oh-dsh-desktop",

        versions = {
            ["0.1.2"] = { ref = "f20581ca3b944f792d8ab7e2b49053c3cb2f68c1" },
        },
        latest = "0.1.2",

        needs_build = false,
        license = "BSD-3-Clause",

        -- non-default bundle patch path
        patch = "./dist/cordis.patch.yml",

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
