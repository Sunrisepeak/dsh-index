package = {
    spec = "1",

    name = "dsh-whale-galgame",
    description = "工作推gal两不误~面向DeepSeek Harness的跨会话事件感知Galgame引擎与界面插件，支持鲸鱼娘/GPT/Claude/Grok/Gemini/Kimi多位模型娘角色",
    repo = "https://github.com/JAdpp/dsh-whale-galgame",
    homepage = "https://github.com/JAdpp/dsh-whale-galgame",
    authors = {"JAdpp"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-whale-galgame",

        versions = {
            ["0.3.0"] = { commit = "baa9af043d62e2b1f115c64a5907b6e5851caf2b" },
        },
        latest = "0.3.0",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
