package = {
    spec = "1",

    name = "dsh-prompt-rewriter",
    description = "One-click prompt enhancement beside the DeepSeek Harness composer: rewrites a draft in place without sending it.",
    repo = "https://github.com/huaguoxingkong/dsh-prompt-rewriter",
    homepage = "https://github.com/huaguoxingkong/dsh-prompt-rewriter",
    licenses = {"MIT"},
    authors = {"huaguoxingkong"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-prompt-rewriter",

        versions = {
            ["1.5.1"] = { commit = "475d343ab3128c909a4498dc14e118427749435a" },
        },
        latest = "1.5.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
