package = {
    spec = "1",

    name = "dsh-kingdom",
    description = "在 DSH 中建立属于你的 Agent 王国——让 Agent 拥有角色、权限、领地与治理秩序，并通过事实验证机制与权威账本，让每一次执行、声明与裁决都可核验、可追溯。",
    repo = "https://github.com/lusblead/dsh-Kingdom",
    homepage = "https://github.com/lusblead/dsh-Kingdom",
    licenses = {"BSD-3-Clause"},
    authors = {"lusblead"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-kingdom",

        versions = {
            ["0.8.0"] = { commit = "9d953e704d0570c9f1e57fcaf75faa9f21e1e95e" },
        },
        latest = "0.8.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
