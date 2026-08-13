package = {
    spec = "1",

    name = "dsh-local-filetree",
    description = "File tree panel for the DSH Web UI: the right details column shows the current session workspace tree (lazy, r",
    repo = "https://github.com/Mongfayi/dsh-local-filetree",
    homepage = "https://github.com/Mongfayi/dsh-local-filetree",
    authors = {"Mongfayi"},

    status = "dev",
    categories = {"dsh-plugin", "web-ui", "tools"},
    keywords = {"dsh", "local", "filetree"},

    dsh = {
        bundle_name = "dsh-local-filetree",
        source = "github",
        origin = "Mongfayi/dsh-local-filetree",

        versions = {
            ["0.1.0"] = { ref = "e009771453c24fcd1d5bfd373106c3b5e6a16d82" },
        },
        latest = "0.1.0",

        needs_build = false,
        license = "NOASSERTION",

        -- Upstream ships no redistributable license, so this index has
        -- no right to mirror it: no `mirror` block, installs straight
        -- from git, and it cannot be recovered if upstream disappears.
    },
}
