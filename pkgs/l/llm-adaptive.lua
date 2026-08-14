package = {
    spec = "1",

    name = "llm-adaptive",
    description = "llm-adaptive",
    repo = "https://github.com/dylan121322/llm-adaptive",
    homepage = "https://github.com/dylan121322/llm-adaptive",
    licenses = {"MIT"},
    authors = {"dylan121322"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "llm-adaptive",

        versions = {
            ["0.1.0"] = { commit = "305be1c75d094c2bfcee014b768906e2b5558b9f" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
