package = {
    spec = "1",

    name = "dsh-ntr",
    description = "让你的Deepseek harness成为一个统一的agent入口，轻松接入codebuddy、claude code、opencode、qoder",
    repo = "https://github.com/GDWhisper/dsh-ntr",
    homepage = "https://github.com/GDWhisper/dsh-ntr",
    licenses = {"MIT"},
    authors = {"GDWhisper"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-ntr",

        versions = {
            ["0.1.6"] = { commit = "6f9cfe9b14fd1d8a42d93410274edd982a72c2c5" },
        },
        latest = "0.1.6",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
