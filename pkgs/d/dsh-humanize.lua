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
        bundle_name = "@humanize/dsh-humanize",

        versions = {
            ["1.18.0"] = { commit = "f39c19d5a596735c9dfaa1cbb0b95c02152b039c" },
        },
        latest = "1.18.0",

        needs_build = true,

        -- Upstream ships no redistributable license, so this index has
        -- no right to mirror it: no `mirror` block, installs straight
        -- from git, and it cannot be recovered if upstream disappears.
    },
}
