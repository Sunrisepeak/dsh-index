package = {
    spec = "1",

    name = "dsh-client-masquerade",
    description = "DeepSeek Harness 插件：让自定义 llm-pi-ai provider 伪装成 Claude Code / Codex 客户端（伪造客户端身份请求头）。A DeepSeek Harness plugin: masquerade a custom llm-pi-ai provider as Claude Code / Codex clients (spoofed client identity headers).",
    repo = "https://github.com/ymh0000123/dsh-client-masquerade",
    homepage = "https://github.com/ymh0000123/dsh-client-masquerade",
    licenses = {"MIT"},
    authors = {"ymh0000123"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-client-masquerade",

        versions = {
            ["1.7.0"] = { commit = "b7e01f6fa148772635df90660add9d34f97e785f" },
        },
        latest = "1.7.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
