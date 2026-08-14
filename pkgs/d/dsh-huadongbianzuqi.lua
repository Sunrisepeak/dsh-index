package = {
    spec = "1",

    name = "dsh-huadongbianzuqi",
    description = "DeepSeek Harness的滑动变祖器插件",
    repo = "https://github.com/zjl88858/dsh-huadongbianzuqi",
    homepage = "https://github.com/zjl88858/dsh-huadongbianzuqi",
    licenses = {"MIT-0"},
    authors = {"zjl88858"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-huadong-bianzuqi",

        versions = {
            ["0.1.0"] = { commit = "19a359e8280fb63dd5c4695cd5d539de05abaf78" },
        },
        latest = "0.1.0",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
