package = {
    spec = "1",

    name = "dsh-plugin-kit",
    description = "Plugin family for the DeepSeek Harness (DSH) Web GUI: a pnpm monorepo with a plugin template, dev kit, and one-command all-in-one bundle — Codegraph, env & secrets, MCP config, profiles, prompts, RSS digest, global search, and terminal panel.",
    repo = "https://github.com/hyzyn/dsh-plugin-kit",
    homepage = "https://github.com/hyzyn/dsh-plugin-kit",
    licenses = {"Apache-2.0"},
    authors = {"hyzyn"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@hyzyn/dsh-plugin-kit",

        versions = {
            ["0.1.33"] = { commit = "18df8e76c0dd4fa2ca8b6d87af875db9e8e67853" },
        },
        latest = "0.1.33",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
