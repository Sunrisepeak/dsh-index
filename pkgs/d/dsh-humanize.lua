package = {
    spec = "1",

    name = "dsh-humanize",
    description = "dsh plugin from zevorn/dsh-humanize",
    repo = "https://github.com/zevorn/dsh-humanize",
    homepage = "https://github.com/zevorn/dsh-humanize",
    authors = {"zevorn"},

    status = "dev",
    categories = {"dsh-plugin", "uncategorized"},
    keywords = {"dsh", "humanize"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@humanize/dsh-humanize",

        versions = {
            ["1.18.0"] = { commit = "f39c19d5a596735c9dfaa1cbb0b95c02152b039c" },
        },
        latest = "1.18.0",

        -- Base rows this bundle replaces. Another bundle patching
        -- any of these in the same profile silently wins or loses,
        -- depending on install order.
        overrides = {"skill-filesystem"},
        needs_build = true,

        -- Upstream ships no redistributable license, so this index has
        -- no right to mirror it: no `mirror` block, installs straight
        -- from git, and it cannot be recovered if upstream disappears.
    },
}
