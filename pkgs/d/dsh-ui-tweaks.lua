package = {
    spec = "1",

    name = "dsh-ui-tweaks",
    description = "一切皆插件，可以定义自己喜欢的dsh，开关控制单项功能，字体大小，表格样式，对话框长度，timeline，git等",
    repo = "https://github.com/wlj521/dsh-ui-tweaks",
    homepage = "https://github.com/wlj521/dsh-ui-tweaks",
    licenses = {"MIT"},
    authors = {"wlj521"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-ui-tweaks",

        versions = {
            ["0.11.0"] = { commit = "349d4dde7c8cf4ffbed78d40eb2100d3636652d9" },
        },
        latest = "0.11.0",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
