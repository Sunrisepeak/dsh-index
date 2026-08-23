package = {
    spec = "1",

    name = "dsh-milestone",
    description = "Git-style milestone timeline for DeepSeek Harness - hover for metadata, click to jump to any message. 会话里程碑导航条：像 Git 提交图一眼定位每条提问，悬停看时间/轮次/耗时/TTFT，点击即跳转。",
    repo = "https://github.com/SnowCrescenter-tech/dsh-milestone",
    homepage = "https://github.com/SnowCrescenter-tech/dsh-milestone",
    licenses = {"MIT"},
    authors = {"SnowCrescenter-tech"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-milestone",

        versions = {
            ["0.6.2"] = { commit = "1d0638fe3041b9d073a49d3dffce79e9b20e2e5b" },
            ["0.6.0"] = { commit = "c238f8c5d4afe153ede8559e5f7e3d1a652b6327" },
        },
        latest = "0.6.2",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
