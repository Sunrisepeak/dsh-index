package = {
    spec = "1",

    name = "dsh-open-in-ide",
    description = "DeepSeek Harness Web UI plugin: add an IDE button that auto-detects local IDEs and opens the current workspace folder.",
    repo = "https://github.com/LJninse/dsh-open-in-ide",
    homepage = "https://github.com/LJninse/dsh-open-in-ide",
    authors = {"LJninse"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-open-in-ide",

        versions = {
            ["0.3.1"] = { commit = "4b476c4f55554f2fe41362ce7a74c326a6242356" },
        },
        latest = "0.3.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
