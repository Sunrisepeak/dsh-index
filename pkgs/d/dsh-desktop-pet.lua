package = {
    spec = "1",

    name = "dsh-desktop-pet",
    description = "A plugin that adds a desktop pet to your DeepSeek Harness, supporting the Codex pet format.",
    repo = "https://github.com/sereinmono/dsh-desktop-pet",
    homepage = "https://github.com/sereinmono/dsh-desktop-pet",
    authors = {"sereinmono"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-desktop-pet",

        versions = {
            ["0.1.0"] = { commit = "d35e0981b37346aff5732a2f605c2de7981aa130" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
