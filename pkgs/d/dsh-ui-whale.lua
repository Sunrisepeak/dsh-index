package = {
    spec = "1",

    name = "dsh-ui-whale",
    description = "【求⭐】🐋DSH Web UI 全手绘像素鲸鱼伙伴插件：会话标题栏常驻，平时眨眼/偶尔摆尾/动胸鳍，思考运行时持续动起来，回合完成头顶喷水，点击还会冒爱心，不工作时还会偷懒睡觉，零核心改动。 【喜欢的话就点点star⭐吧~】",
    repo = "https://github.com/lhh010/dsh-ui-whale",
    homepage = "https://github.com/lhh010/dsh-ui-whale",
    licenses = {"BSD-3-Clause"},
    authors = {"lhh010"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@dsh-external/dsh-ui-whale",

        versions = {
            ["0.3.27"] = { commit = "1647120dcd84435cf5eabb5f0a64cc6bf9f8ae71" },
        },
        latest = "0.3.27",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
