package = {
    spec = "1",

    name = "dsh-lorebookmd",
    description = "DSH lorebook-driven fiction writer plugin: import Tavern/SillyTavern character cards & world books, save local Markdown settings, generate novel prose referencing the world.",
    repo = "https://github.com/609476965/dsh-LorebookMD",
    homepage = "https://github.com/609476965/dsh-LorebookMD",
    authors = {"609476965"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-lorebookmd",

        versions = {
            ["1.0.0"] = { commit = "4bc4110efbfb4888286b81aaf53191705dade9dd" },
        },
        latest = "1.0.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
