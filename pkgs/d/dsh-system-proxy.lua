package = {
    spec = "1",

    name = "dsh-system-proxy",
    description = "DSH host plugin - smart outbound HTTP(S) routing: named proxies (http/https/socks4/4a/5/5h), per-host/provider/plugin rules, direct-first fallback with health memory (global fetch + node http/https)",
    repo = "https://github.com/khiqwq/dsh-system-proxy",
    homepage = "https://github.com/khiqwq/dsh-system-proxy",
    licenses = {"MIT"},
    authors = {"khiqwq"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-system-proxy",

        versions = {
            ["0.3.0"] = { commit = "35c4915241fc03cdcc7657e120a79eff6a3b72e9" },
        },
        latest = "0.3.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
