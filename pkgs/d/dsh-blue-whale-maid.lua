package = {
    spec = "1",

    name = "dsh-blue-whale-maid",
    description = "dsh plugin from yuxino/dsh-blue-whale-maid",
    repo = "https://github.com/yuxino/dsh-blue-whale-maid",
    homepage = "https://github.com/yuxino/dsh-blue-whale-maid",
    authors = {"yuxino"},

    status = "dev",
    categories = {"dsh-plugin", "fun"},
    keywords = {"dsh", "blue-whale-maid", "desktop-pet", "pet", "pixel-pet"},

    dsh = {
        bundle_name = "dsh-blue-whale-maid",
        source = "github",
        origin = "yuxino/dsh-blue-whale-maid",

        versions = {
            ["1.1.0"] = { ref = "a9f95a467b2e0d6e4d0f0339d18b48985ac52297" },
        },
        latest = "1.1.0",

        needs_build = false,
        license = "NOASSERTION",

        -- Upstream ships no redistributable license, so this index has
        -- no right to mirror it: no `mirror` block, installs straight
        -- from git, and it cannot be recovered if upstream disappears.
    },
}
