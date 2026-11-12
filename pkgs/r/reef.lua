package = {
    spec = "1",

    name = "reef",
    description = "DSH 插件全家桶:浏览器自动化 + MCP Server + GitHub/GitLab 自动评审 + 原生嵌入面板 | One install, five modules for DeepSeek Harness: browser automation, MCP server, GitHub & GitLab automation, native in-app panel",
    repo = "https://github.com/huey1in/reef",
    homepage = "https://github.com/huey1in/reef",
    licenses = {"MIT"},
    authors = {"huey1in"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-reef",

        versions = {
            ["1.5.2"] = { commit = "5d5ade9af01e134a3f64dc9619eb1881993d4a76" },
        },
        latest = "1.5.2",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
