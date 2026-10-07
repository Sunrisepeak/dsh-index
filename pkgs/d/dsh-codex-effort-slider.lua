package = {
    spec = "1",

    name = "dsh-codex-effort-slider",
    description = "Codex 风格的推理等级滑条（DeepSeek Harness 插件）：可拖动连续滑条 + 高档位渐变星尘特效",
    repo = "https://github.com/Microqian2th/dsh-codex-effort-slider",
    homepage = "https://github.com/Microqian2th/dsh-codex-effort-slider",
    licenses = {"MIT"},
    authors = {"Microqian2th"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "tui",

        bundle_name = "dsh-codex-effort-slider",

        versions = {
            ["1.0.0"] = { commit = "af723caf3387e64ae28aa69c4fd235b1b662e3ae" },
        },
        latest = "1.0.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
