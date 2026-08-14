package = {
    spec = "1",

    name = "dsh-codex-agent-bridge",
    description = "Use the Codex models included with your ChatGPT subscription directly in DeepSeek Harness—no API key or separate API billing.",
    repo = "https://github.com/je00/dsh-codex-agent-bridge",
    homepage = "https://github.com/je00/dsh-codex-agent-bridge",
    licenses = {"MIT"},
    authors = {"je00"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@jadynchou/dsh-codex-agent-bridge",

        versions = {
            ["0.2.0"] = { commit = "6fe1b4e1aab111fadcf9e224fd9b13f326f95e94" },
        },
        latest = "0.2.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
