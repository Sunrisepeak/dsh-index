package = {
    spec = "1",

    name = "dsh-prompt-persona",
    description = "DSH plugin: edit the system prompt (deployment persona) from the Settings page, with live preview.",
    repo = "https://github.com/Xilin3/dsh-prompt-persona",
    homepage = "https://github.com/Xilin3/dsh-prompt-persona",
    licenses = {"MIT"},
    authors = {"Xilin3"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@xilin3/dsh-prompt-persona",

        versions = {
            ["0.1.0"] = { commit = "1946101995e86dacdd1fb6c2ee0d118ecace0a57" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
