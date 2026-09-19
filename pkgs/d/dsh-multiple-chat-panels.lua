package = {
    spec = "1",

    name = "dsh-multiple-chat-panels",
    description = "DeepSeek Harness 多对话面板：并排查看并与多个 Agent 会话同时交互。",
    repo = "https://github.com/WilliamShi666/dsh-multiple-chat-panels",
    homepage = "https://github.com/WilliamShi666/dsh-multiple-chat-panels",
    licenses = {"MIT"},
    authors = {"WilliamShi666"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "multiple-chat-panels",

        versions = {
            ["0.1.1"] = { commit = "03a50af07ab9dc9df11da9201cc31ecc59012b9a" },
        },
        latest = "0.1.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
