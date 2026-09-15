package = {
    spec = "1",

    name = "dsh-one-gateway",
    description = "Private DSH One Gateway — loopback, identity-first ingress for DeepSeek Harness",
    repo = "https://github.com/TiantianFlow/dsh-one-gateway",
    homepage = "https://github.com/TiantianFlow/dsh-one-gateway",
    licenses = {"MIT"},
    authors = {"TiantianFlow"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-one-gateway",

        versions = {
            ["0.1.0"] = { commit = "e62f91b5781877a807d5ff78be6343017bd7393a" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
