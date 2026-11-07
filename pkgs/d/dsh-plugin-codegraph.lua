package = {
    spec = "1",

    name = "dsh-plugin-codegraph",
    description = "Structural code intelligence for DeepSeek Harness (dsh) — gives the agent codegraph and codegraph_index tools to find where a symbol is declared, what calls it, and what a change   reaches, from a tree-sitter index it builds itself. Compatible with the codegraph CLI's on-disk format.",
    repo = "https://github.com/CC19990113/dsh-plugin-codegraph",
    homepage = "https://github.com/CC19990113/dsh-plugin-codegraph",
    licenses = {"MIT"},
    authors = {"CC19990113"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-plugin-codegraph-root",

        versions = {
            ["0.1.0"] = { commit = "fff66800577770a2f92af0418cb9e336fd6086b2" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
