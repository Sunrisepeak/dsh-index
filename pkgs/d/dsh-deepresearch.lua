package = {
    spec = "1",

    name = "dsh-deepresearch",
    description = "dsh plugin from havingautism/dsh-deepresearch",
    repo = "https://github.com/havingautism/dsh-deepresearch",
    homepage = "https://github.com/havingautism/dsh-deepresearch",
    authors = {"havingautism"},

    status = "dev",
    categories = {"dsh-plugin", "uncategorized"},
    keywords = {"dsh", "deepresearch"},

    dsh = {
        bundle_name = "@deepseek-ai/dsh-deepresearch",
        source = "github",
        origin = "havingautism/dsh-deepresearch",

        versions = {
            ["0.1.0"] = { ref = "efbdcc72e082ffb8a363686be6585a5e6e053300" },
        },
        latest = "0.1.0",

        needs_build = false,
        license = "NONE",

        -- Upstream ships no redistributable license, so this index has
        -- no right to mirror it: no `mirror` block, installs straight
        -- from git, and it cannot be recovered if upstream disappears.
    },
}
