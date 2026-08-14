package = {
    spec = "1",

    name = "dsh-auto-approve",
    description = "Conservative auto-approval preset for DeepSeek Harness sandbox escalations",
    repo = "https://github.com/Jiao-XXX/dsh-auto-approve",
    homepage = "https://github.com/Jiao-XXX/dsh-auto-approve",
    licenses = {"MIT"},
    authors = {"Jiao-XXX"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-auto-approve",

        versions = {
            ["0.3.0"] = { commit = "5c60b779f6853ebde89bfa5916d6d5e2eec8cd8c" },
        },
        latest = "0.3.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
