package = {
    spec = "1",

    name = "dsh-boot-animation-pro",
    description = "DSH 片头开机动画增强版：播放控制、触发规则、会话名单、分时段片头、片库管理、中英双语。A full-frame intro animation for DSH. Fork of NativeDog1/dsh-boot-animation.",
    repo = "https://github.com/Yiheng-guo/dsh-boot-animation-pro",
    homepage = "https://github.com/Yiheng-guo/dsh-boot-animation-pro",
    authors = {"Yiheng-guo"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-boot-animation-pro",

        versions = {
            ["1.0.0"] = { commit = "0e6a9287fa9c92af569e9f7ad95683a77bf6a1e9" },
        },
        latest = "1.0.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
