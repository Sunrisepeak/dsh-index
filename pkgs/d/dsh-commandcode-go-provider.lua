package = {
    spec = "1",

    name = "dsh-commandcode-go-provider",
    description = "Command Code Go API provider for dsh. Command Code 订阅 + DeekSeek Harness 兼容层",
    repo = "https://github.com/jiesou/dsh-commandcode-go-provider",
    homepage = "https://github.com/jiesou/dsh-commandcode-go-provider",
    licenses = {"MIT"},
    authors = {"jiesou"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "compat",

        bundle_name = "@jiesou/dsh-commandcode-go-provider",

        versions = {
            ["0.1.11"] = { commit = "6f532336954b3a69f8be627d0f414e311f78957e" },
        },
        latest = "0.1.11",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
