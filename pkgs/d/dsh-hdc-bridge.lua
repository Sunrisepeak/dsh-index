package = {
    spec = "1",

    name = "dsh-hdc-bridge",
    description = "DSH 原生鸿蒙开发助手：hdc 设备闭环调试 + 设备面板（官方 client 插件形态）+ 离线官方知识层（Tier-1 随包）+ DevEco CLI 构建/签名/模拟器控制 / DSH-native HarmonyOS dev assistant: hdc device loop, live device panel, offline official knowledge, DevEco CLI build/sign/emulator",
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
            ["0.7.2"] = { commit = "41b9cf65c2c6571aad27d140d922448082fa965b" },
        },
        latest = "0.7.2",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
