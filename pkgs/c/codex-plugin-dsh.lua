package = {
    spec = "1",

    name = "codex-plugin-dsh",
    description = "Use local Codex App Server as a model provider in DeepSeek Harness",
    repo = "https://github.com/wingoo/codex-plugin-dsh",
    homepage = "https://github.com/wingoo/codex-plugin-dsh",
    licenses = {"MIT"},
    authors = {"wingoo"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "codex-plugin-dsh",

        versions = {
            ["0.1.0"] = { commit = "79fe7503390d641680bad8efade52782a3c31ced" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
