package = {
    spec = "1",

    name = "dsh-easyrewrite",
    description = "DSH Web内目前最无感的消息撤回、重编辑插件，原版体验，兼容性强，功能简单可开关，设置丰富，现代化轻量ui框架。The most seamless message recall & re-edit plugin for DSH Web — native experience, strong compatibility, simple toggles, rich settings, modern lightweight UI. DSH Web で最もシームレスなメッセージ撤回・再編集プラグイン——ネイティブ体験、高い互換性、シンプルなトグル、充実した設定、モダンで軽量な UI。",
    repo = "https://github.com/Renzic-Stone/DSH-EasyRewrite",
    homepage = "https://github.com/Renzic-Stone/DSH-EasyRewrite",
    licenses = {"MIT"},
    authors = {"Renzic-Stone"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-easyrewrite",

        versions = {
            ["1.3.6"] = { commit = "c1b1e990c4f7195548df38d819684f5329cf948e" },
        },
        latest = "1.3.6",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
