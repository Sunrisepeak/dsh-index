package = {
    spec = "1",

    name = "dsh-overdrive",
    description = "OpenClaw-style multi-platform gateway for DeepSeek Harness: WhatsApp / Telegram / Discord / Slack / Feishu / DingTalk / WeCom with in-chat trajectory replay, subagents & cron, native approval buttons | DSH 界的 OpenClaw：把 DSH 变成多平台聊天智能体，聊天内全程可追踪",
    repo = "https://github.com/temotee2103/dsh-overdrive",
    homepage = "https://github.com/temotee2103/dsh-overdrive",
    licenses = {"MIT"},
    authors = {"temotee2103"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- The plugin bundle lives in packages/gateway-core of this monorepo
        -- and is published to npm under this name; `dsh plugin add
        -- @dsh-overdrive/gateway-core` is the native install line.
        profile = "web",

        bundle_name = "@dsh-overdrive/gateway-core",

        versions = {
            ["0.1.1"] = { commit = "eb610f17c2af87da69922064a11bdebd65928bce" },
        },
        latest = "0.1.1",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
