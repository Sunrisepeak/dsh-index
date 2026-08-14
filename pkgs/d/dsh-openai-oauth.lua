package = {
    spec = "1",

    name = "dsh-openai-oauth",
    description = "DeepSeek Harness provider for GPT models using managed ChatGPT OAuth through Codex app-server",
    repo = "https://github.com/DGPisces/dsh-openai-oauth",
    homepage = "https://github.com/DGPisces/dsh-openai-oauth",
    licenses = {"MIT"},
    authors = {"DGPisces"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "headless",

        bundle_name = "dsh-openai-oauth",

        versions = {
            ["0.4.0"] = { commit = "87d4d89ae5aa1b0ded5a8f89ca190a0fe3d78212" },
        },
        latest = "0.4.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
