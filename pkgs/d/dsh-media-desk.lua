package = {
    spec = "1",

    name = "dsh-media-desk",
    description = "DeepSeek Harness 自媒体工作台插件：一句话记灵感，一键生成脚本、封面、配图和分镜",
    repo = "https://github.com/woniuniuniu/dsh-media-desk",
    homepage = "https://github.com/woniuniuniu/dsh-media-desk",
    licenses = {"MIT"},
    authors = {"woniuniuniu"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-media-desk",

        versions = {
            ["2.4.0"] = { commit = "94cc74c2c935dc2d53fc5edddb6fa1e2a0ebb358" },
        },
        latest = "2.4.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
