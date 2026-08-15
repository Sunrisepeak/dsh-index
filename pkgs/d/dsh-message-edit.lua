package = {
    spec = "1",

    name = "dsh-message-edit",
    description = "DSH plugin: branch-based message editing, reroll, retry, version timeline",
    repo = "https://github.com/Moeblack/dsh-message-edit",
    homepage = "https://github.com/Moeblack/dsh-message-edit",
    authors = {"Moeblack"},

    status = "dev",
    categories = {"dsh-plugin", "uncategorized"},
    keywords = {"dsh", "message", "edit"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-message-edit",

        versions = {
            ["0.2.1"] = { commit = "e950651786e916feebe5a49c8e4ca46afdca379d" },
            ["0.2.0"] = { commit = "3541ed25a82c0b7d76ccc71d265e029613b639b0" },
        },
        latest = "0.2.1",

        needs_build = false,

        -- Upstream ships no redistributable license, so this index has
        -- no right to mirror it: no `mirror` block, installs straight
        -- from git, and it cannot be recovered if upstream disappears.
    },
}
