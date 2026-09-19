package = {
    spec = "1",

    name = "dsh-whale-musume",
    description = "DeepSeek Harness 桌宠插件：元气鲸鱼娘陪你写代码 🐋",
    repo = "https://github.com/Sutera-Diffusus/dsh-whale-musume",
    homepage = "https://github.com/Sutera-Diffusus/dsh-whale-musume",
    licenses = {"MIT"},
    authors = {"Sutera-Diffusus"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-whale-musume",

        versions = {
            ["1.3.0"] = { commit = "047246e47d83b4732ba57648f2d557641fac72bf" },
        },
        latest = "1.3.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
