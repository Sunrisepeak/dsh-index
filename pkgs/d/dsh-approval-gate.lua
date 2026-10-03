package = {
    spec = "1",

    name = "dsh-approval-gate",
    description = "DeepSeek Harness 自动审批门控：Flash 预判不可回补操作，安全自动批准、危险转人工（fail-safe）",
    repo = "https://github.com/moon09300731/dsh-approval-gate",
    homepage = "https://github.com/moon09300731/dsh-approval-gate",
    licenses = {"MIT"},
    authors = {"moon09300731"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-approval-gate",

        versions = {
            ["0.5.2"] = { commit = "8419bc3722a237a85c033565be6ac06074f05d92" },
        },
        latest = "0.5.2",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
