package = {
    spec = "1",

    name = "dsh-diff-viewer",
    description = "DSH Web GUI PiUI-style diff viewer plugin: replaces the stock DiffBlock for write/edit tool calls via ui-tool ",
    repo = "https://github.com/lehhair/dsh-diff-viewer",
    homepage = "https://github.com/lehhair/dsh-diff-viewer",
    authors = {"lehhair"},

    status = "dev",
    categories = {"dsh-plugin", "uncategorized"},
    keywords = {"dsh", "diff", "viewer"},

    dsh = {
        bundle_name = "@dsh-external/dsh-diff-viewer",
        source = "github",
        origin = "lehhair/dsh-diff-viewer",

        versions = {
            ["0.1.0"] = { ref = "7c9c5f977c71e864e1551e30cd48151310b23ab4" },
        },
        latest = "0.1.0",

        needs_build = false,
        license = "NONE",

        -- Upstream ships no redistributable license, so this index has
        -- no right to mirror it: no `mirror` block, installs straight
        -- from git, and it cannot be recovered if upstream disappears.
    },
}
