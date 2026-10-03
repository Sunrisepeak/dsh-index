package = {
    spec = "1",

    name = "dsh-notifier",
    description = "Unified notification push plugin for DeepSeek Harness (DSH): one minimal notify() API, 8 channel adapters (telegram/dingtalk/feishu/wxpusher/pushplus/serverchan/bark/webhook), dual trigger (auto session events + agent tool).",
    repo = "https://github.com/THEWOLFWALKER/dsh-notifier",
    homepage = "https://github.com/THEWOLFWALKER/dsh-notifier",
    licenses = {"MIT"},
    authors = {"THEWOLFWALKER"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-notifier",

        versions = {
            ["0.4.0"] = { commit = "601c717b68dc50b803256049839b8e2476e796ea" },
        },
        latest = "0.4.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
