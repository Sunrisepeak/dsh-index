package = {
    spec = "1",

    name = "dsh-files",
    description = "DeepSeek Harness dual-face plugin: session-isolated file upload with colorful composer cards + read_document tool (text/PDF/DOCX/XLSX) with content sniffing and LRU caching",
    repo = "https://github.com/taxueseek/dsh-files",
    homepage = "https://github.com/taxueseek/dsh-files",
    authors = {"taxueseek"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-files",

        versions = {
            ["0.2.0"] = { commit = "2c453ab3f74659f91a84a35f71ff270eea77e674" },
        },
        latest = "0.2.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
