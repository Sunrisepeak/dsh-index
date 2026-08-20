package = {
    spec = "1",

    name = "dsh-tailscale-gateway",
    description = "Private Tailscale access for DeepSeek Harness Web: exact user allowlists, loopback-only gateway, and guarded Serve setup",
    repo = "https://github.com/TiantianFlow/dsh-tailscale-gateway",
    homepage = "https://github.com/TiantianFlow/dsh-tailscale-gateway",
    licenses = {"MIT"},
    authors = {"TiantianFlow"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-tailscale-gateway",

        versions = {
            ["0.1.0"] = { commit = "1a578019dfa2374223e469519e4a1e269d2e8e38" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
