package = {
    spec = "1",

    name = "dsh-codex-auth",
    description = "DeepSeek Harness plugin that reuses the local Codex CLI ChatGPT login and adds a native GPT Auth settings card",
    repo = "https://github.com/suntianc/dsh-codex-auth",
    homepage = "https://github.com/suntianc/dsh-codex-auth",
    licenses = {"MIT"},
    authors = {"suntianc"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-codex-auth",

        versions = {
            ["0.2.0"] = { commit = "484f5383dc7a80df426ef817daf02a67d9c1dc45" },
        },
        latest = "0.2.0",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
