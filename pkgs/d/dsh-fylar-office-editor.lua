package = {
    spec = "1",

    name = "dsh-fylar-office-editor",
    description = "Office document preview, editing, and DOCX generation for DeepSeek Harness, powered by Fylar Office SDK.",
    repo = "https://github.com/FylarOpen/dsh-fylar-office-editor",
    homepage = "https://github.com/FylarOpen/dsh-fylar-office-editor",
    authors = {"FylarOpen"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@fylar/dsh-fylar-office-editor",

        versions = {
            ["0.1.4"] = { commit = "74b98921956e2f62022b27efd15592a79f430982" },
        },
        latest = "0.1.4",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
