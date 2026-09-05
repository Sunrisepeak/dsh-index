package = {
    spec = "1",

    name = "dsh-office",
    description = "办公三件套！Office document tools for DeepSeek Harness (dsh): generate, read, and edit spreadsheets (.xlsx), PDFs, and presentations (.pptx).",
    repo = "https://github.com/omdsh-dev/dsh-office",
    homepage = "https://github.com/omdsh-dev/dsh-office",
    licenses = {"Apache-2.0"},
    authors = {"omdsh-dev"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@huiliyi37/dsh-office",

        versions = {
            ["0.2.1"] = { commit = "a59db95e2c763a48b97be8b96b3a81e6550af792" },
        },
        latest = "0.2.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
