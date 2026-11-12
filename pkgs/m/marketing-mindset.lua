package = {
    spec = "1",

    name = "marketing-mindset",
    description = "The marketing OS for AI agents — think like a marketer first, get tactics as the output.",
    repo = "https://github.com/axelfreeman/marketing-mindset",
    homepage = "https://github.com/axelfreeman/marketing-mindset",
    licenses = {"MIT"},
    authors = {"axelfreeman"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-marketing-mindset",

        versions = {
            ["0.3.0"] = { commit = "2bb5507186c935bbeb8fe4a582a27e76086bbb04" },
        },
        latest = "0.3.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
