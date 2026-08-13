package = {
    spec = "1",

    name = "dsh-ultra-ui",
    description = "dsh plugin from havingautism/dsh-ultra-ui",
    repo = "https://github.com/havingautism/dsh-ultra-ui",
    homepage = "https://github.com/havingautism/dsh-ultra-ui",
    authors = {"havingautism"},

    status = "dev",
    categories = {"dsh-plugin", "web-ui"},
    keywords = {"dsh", "ultra"},

    dsh = {
        bundle_name = "@deepseek-ai/dsh-ultra-ui",
        source = "github",
        origin = "havingautism/dsh-ultra-ui",

        versions = {
            ["0.1.0"] = { ref = "bdf1588bd2ec6263b6b8007b71a1f766634f23bd" },
        },
        latest = "0.1.0",

        needs_build = false,
        license = "NONE",

        -- Upstream ships no redistributable license, so this index has
        -- no right to mirror it: no `mirror` block, installs straight
        -- from git, and it cannot be recovered if upstream disappears.
    },
}
