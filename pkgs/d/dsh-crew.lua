package = {
    spec = "1",

    name = "dsh-crew",
    description = "DeepSeek Harness (DSH) plugin: dispatch work to DSH agents from Claude Code / Codex — native subagent progress, in-host worker sessions with per-tier presets, and a multimodal bridge that lends the text-only harness vision and image generation.",
    repo = "https://github.com/ZSeven-W/dsh-crew",
    homepage = "https://github.com/ZSeven-W/dsh-crew",
    licenses = {"MIT"},
    authors = {"ZSeven-W"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@zseven-w/dsh-crew",

        versions = {
            ["0.1.0-rc.1"] = { commit = "64fd1957a5f6cc93b5f1871da508feedec043e6c" },
        },
        latest = "0.1.0-rc.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
