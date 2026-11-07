package = {
    spec = "1",

    name = "dsh-claude-style",
    description = "Claude Code Desktop theme for DeepSeek Harness｜ 为 DeepSeek Harness 网页 GUI 打造的 Claude Code 桌面主题",
    repo = "https://github.com/Nwflower/dsh-claude-style",
    homepage = "https://github.com/Nwflower/dsh-claude-style",
    authors = {"Nwflower"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-claude-style",

        versions = {
            ["0.5.2"] = { commit = "cd32db352d086a37755ead9ba59b788136c4a25b" },
        },
        latest = "0.5.2",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
