package = {
    spec = "1",

    name = "dsh-network-settings",
    description = "DSH网络设置插件 | DeepSeek Harness network diagnostics, proxy detection and repair for Windows/WSL/MacOS",
    repo = "https://github.com/kanneiren/dsh-network-settings",
    homepage = "https://github.com/kanneiren/dsh-network-settings",
    licenses = {"MIT"},
    authors = {"kanneiren"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-network-settings",

        versions = {
            ["0.3.3"] = { commit = "567ca07bccd2246d96d49ffa849a38b35c2cb016" },
        },
        latest = "0.3.3",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
