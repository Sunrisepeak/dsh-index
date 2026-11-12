package = {
    spec = "1",

    name = "dsh-computer-use",
    description = "Text-first browser & background macOS control for DeepSeek Harness (DSH): target the right process and window without taking the user's pointer. 为 DSH 提供文本优先的电脑控制：后台操作 Chromium 与 macOS，不抢前台、不移动鼠标。",
    repo = "https://github.com/ZRui-C/dsh-computer-use",
    homepage = "https://github.com/ZRui-C/dsh-computer-use",
    licenses = {"Apache-2.0"},
    authors = {"ZRui-C"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-computer-use",

        versions = {
            ["0.3.0"] = { commit = "0b0a0844018b56a6a8e95aefea6529004b8341c4" },
        },
        latest = "0.3.0",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
