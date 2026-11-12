package = {
    spec = "1",

    name = "dsh-plugin-notify-sounds",
    description = "DeepSeek Harness原生风格提示音插件",
    repo = "https://github.com/BillCx330/dsh-plugin-notify-sounds",
    homepage = "https://github.com/BillCx330/dsh-plugin-notify-sounds",
    licenses = {"MIT"},
    authors = {"BillCx330"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-plugin-notify-sounds",

        versions = {
            ["1.9.2"] = { commit = "50b9f3d7f32a6322b8d286ade5e50f9b7545b64f" },
        },
        latest = "1.9.2",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
