package = {
    spec = "1",

    name = "dsh-drawai",
    description = "DSH 右侧栏里的可编辑画布 —— 加上让模型直接改图的两个工具",
    repo = "https://github.com/fourzkw/dsh-drawai",
    homepage = "https://github.com/fourzkw/dsh-drawai",
    licenses = {"MIT"},
    authors = {"fourzkw"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-drawai",

        versions = {
            ["0.3.2"] = { commit = "06ea502f369f5e8b3d8bb3ef36660d277aacb21c" },
        },
        latest = "0.3.2",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
