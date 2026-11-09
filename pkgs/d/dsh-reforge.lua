package = {
    spec = "1",

    name = "dsh-reforge",
    description = "DSH-Reforge (dsh-reforge) — DeepSeek Harness plugin for traceable experience from test-verified Python bug fixes. 从有测试依据的 Python 修复中积累可追溯经验。Experimental alpha · DSH 0.2.0-rc.2 / 0.2.1-rc.5.",
    repo = "https://github.com/wang1299/dsh-reforge",
    homepage = "https://github.com/wang1299/dsh-reforge",
    licenses = {"MIT"},
    authors = {"wang1299"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-reforge",

        versions = {
            ["0.1.0-alpha.2"] = { commit = "1df95d732d57cdc7be34b18dcd75bbfbbc85c8be" },
        },
        latest = "0.1.0-alpha.2",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
