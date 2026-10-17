package = {
    spec = "1",

    name = "deepseek-harness-remote",
    description = "基于 DeepSeek Harness 插件机制的多端远程访问方案，让桌面端与 Android 端安全连接并操作远程 Harness。（A multi-device remote access solution built on the DeepSeek Harness plugin system, enabling desktop and Android clients to securely connect to and operate a remote Harness.）",
    repo = "https://github.com/liguobao/deepseek-harness-remote",
    homepage = "https://github.com/liguobao/deepseek-harness-remote",
    authors = {"liguobao"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "ds-harness-remote",

        versions = {
            ["0.3.33"] = { commit = "e590f6a19294023237d0d3d909612473cb34815a" },
        },
        latest = "0.3.33",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
