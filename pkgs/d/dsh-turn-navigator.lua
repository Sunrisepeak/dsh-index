package = {
    spec = "1",

    name = "dsh-turn-navigator",
    description = "Private DSH Web turn navigation plugin",
    repo = "https://github.com/vibeinging/dsh-turn-navigator",
    homepage = "https://github.com/vibeinging/dsh-turn-navigator",
    licenses = {"BSD-3-Clause"},
    authors = {"vibeinging"},

    status = "dev",
    categories = {"dsh-plugin", "uncategorized"},
    keywords = {"dsh", "turn", "navigator"},

    dsh = {
        bundle_name = "@deepseek-ai/dsh-turn-navigator",

        versions = {
            ["0.0.1"] = { commit = "bcae07a2684205b3ebbd3976493c9084c2e882a1" },
        },
        latest = "0.0.1",

        needs_build = false,

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
