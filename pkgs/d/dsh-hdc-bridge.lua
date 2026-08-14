package = {
    spec = "1",

    name = "dsh-hdc-bridge",
    description = "DSH 原生鸿蒙开发助手：hdc 设备闭环调试 + 离线官方知识层（Tier-1 随包）+ DevEco CLI 构建通道 / DSH-native HarmonyOS dev assistant: hdc device loop, offline official knowledge, DevEco CLI builds",
    repo = "https://github.com/1na-ko/dsh-hdc-bridge",
    homepage = "https://github.com/1na-ko/dsh-hdc-bridge",
    licenses = {"MIT"},
    authors = {"1na-ko"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-hdc-bridge",

        versions = {
            ["0.6.1"] = { commit = "5d4db7fca516165b33d96c3b7ad892a47314c620" },
        },
        latest = "0.6.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
