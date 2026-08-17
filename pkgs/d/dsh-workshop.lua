package = {
    spec = "1",

    name = "dsh-workshop",
    description = "Lightweight plugin toggle for DeepSeek Harness: identity badges (official / npm / GitHub / local), voice-style patch-layer switches, and curated risk labels | 轻量插件开关：插件身份标签、发声式开关、风险标签",
    repo = "https://github.com/Zlyraz/dsh-workshop",
    homepage = "https://github.com/Zlyraz/dsh-workshop",
    licenses = {"MIT"},
    authors = {"Zlyraz"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh", "plugin-manager"},

    dsh = {
        kind = "plugin",
        profile = "web",

        bundle_name = "dsh-workshop",

        versions = {
            ["0.1.0"] = { commit = "e10452e6883e0bff81997ea49298b33003a0037a" },
        },
        latest = "0.1.0",

        needs_build = false,
    },
}
