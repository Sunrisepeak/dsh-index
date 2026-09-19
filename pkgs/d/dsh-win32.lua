package = {
    spec = "1",

    name = "dsh-win32",
    description = "在 Windows 上把 DSH 用起来。一行装好极简模式的持久 shell，沙箱内也能用 | Get DSH working on Windows: persistent shell for Minimal mode, sandbox included",
    repo = "https://github.com/sjh9714/dsh-win32",
    homepage = "https://github.com/sjh9714/dsh-win32",
    licenses = {"MIT"},
    authors = {"sjh9714"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-win32",

        versions = {
            ["0.14.0"] = { commit = "1e3e54cbf34853ad9ca22084d515932903c2535f" },
        },
        latest = "0.14.0",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
