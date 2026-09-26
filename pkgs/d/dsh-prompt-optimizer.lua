package = {
    spec = "1",

    name = "dsh-prompt-optimizer",
    description = "DSH Web 插件 v0.2.1-beta.1（适用于 dsh-0.1.6-alpha.1）：按回车先由『传话 AI』把提示词改写成可直接发给工作 AI 的命令——四档强度、按难度定流程长度、按会话隔离，确认后再发送",
    repo = "https://github.com/WestFox-AwA/dsh-prompt-optimizer",
    homepage = "https://github.com/WestFox-AwA/dsh-prompt-optimizer",
    licenses = {"BSD-3-Clause"},
    authors = {"WestFox-AwA"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@dsh-external/dsh-prompt-optimizer",

        versions = {
            ["0.2.1-beta.1"] = { commit = "0c4b10beb9bcfad68ae17d970de9b00f6f03ac18" },
        },
        latest = "0.2.1-beta.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
