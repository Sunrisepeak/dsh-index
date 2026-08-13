package = {
    spec = "1",

    name = "dsh-notebooks",
    description = "dsh plugin from havingautism/dsh-notebooks",
    repo = "https://github.com/havingautism/dsh-notebooks",
    homepage = "https://github.com/havingautism/dsh-notebooks",
    authors = {"havingautism"},

    status = "dev",
    categories = {"dsh-plugin", "memory"},
    keywords = {"dsh", "notebooks"},

    dsh = {
        bundle_name = "@deepseek-ai/dsh-notebooks",
        source = "github",
        origin = "havingautism/dsh-notebooks",

        versions = {
            ["0.1.0"] = { ref = "bcafd65f94413072289104a11a0b35aecd7e158a" },
        },
        latest = "0.1.0",

        needs_build = false,
        license = "NONE",

        -- Upstream ships no redistributable license, so this index has
        -- no right to mirror it: no `mirror` block, installs straight
        -- from git, and it cannot be recovered if upstream disappears.
    },
}
