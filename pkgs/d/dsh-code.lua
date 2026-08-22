package = {
    spec = "1",

    name = "dsh-code",
    description = "Claude-Code-style TUI bundle for DeepSeek Harness. 充分结合 DSH 的核心机制与Codex CLI 、Claude Code 的优秀机制，打造的 DSH-Code.",
    repo = "https://github.com/UNLINEARITY/dsh-code",
    homepage = "https://github.com/UNLINEARITY/dsh-code",
    licenses = {"MIT"},
    authors = {"UNLINEARITY"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "cli",

        bundle_name = "dsh-code",

        versions = {
            ["0.7.0"] = { commit = "dae45b70f2641c3e93c9398b114ebd76f65af947" },
        },
        latest = "0.7.0",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
