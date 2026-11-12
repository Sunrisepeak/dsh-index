package = {
    spec = "1",

    name = "dsh-marktext",
    description = "MarkText (muya) WYSIWYG Markdown editor for the DeepSeek Harness right sidebar",
    repo = "https://github.com/Roland0511/dsh-marktext",
    homepage = "https://github.com/Roland0511/dsh-marktext",
    licenses = {"MIT"},
    authors = {"Roland0511"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "desktop",

        bundle_name = "dsh-marktext",

        versions = {
            ["0.1.11"] = { commit = "781450a4925febc1b5a098109dd125d23057c5ac" },
        },
        latest = "0.1.11",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
