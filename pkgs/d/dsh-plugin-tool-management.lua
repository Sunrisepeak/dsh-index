package = {
    spec = "1",

    name = "dsh-plugin-tool-management",
    description = "一个设置面板，统一管理 MCP、技能、记忆、子智能体、提示词和归档会话；可自定义搭配场景，一个场景即可切换整个环境；Agent也能帮你操作这个插件。 | One settings panel managing MCP, skills, memory, subagents, prompts and sessions; customize scene combos to switch the whole environment; the Agent can also operate this plugin for you.",
    repo = "https://github.com/ouli-1242/dsh-plugin-tool-management",
    homepage = "https://github.com/ouli-1242/dsh-plugin-tool-management",
    licenses = {"MIT"},
    authors = {"ouli-1242"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-plugin-tool-management",

        versions = {
            ["0.21.8"] = { commit = "0a7ce85e1d2c7fa53ae08ab8063f530250fc3fc4" },
        },
        latest = "0.21.8",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
