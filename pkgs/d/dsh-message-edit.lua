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
        bundle_name = "dsh-message-edit",
        source = "github",
        origin = "Moeblack/dsh-message-edit",

        versions = {
            ["0.2.0"] = { ref = "3541ed25a82c0b7d76ccc71d265e029613b639b0" },
        },
        latest = "0.2.0",

        needs_build = false,
        license = "NONE",

        -- Upstream ships no redistributable license, so this index has
        -- no right to mirror it: no `mirror` block, installs straight
        -- from git, and it cannot be recovered if upstream disappears.
    },
}
