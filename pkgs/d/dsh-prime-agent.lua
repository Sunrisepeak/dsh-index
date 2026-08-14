package = {
    spec = "1",

    name = "dsh-prime-agent",
    description = "Prime Agent-inspired persistent RLM control plane for DeepSeek Harness Code Mode",
    repo = "https://github.com/yoke233/dsh-prime-agent",
    homepage = "https://github.com/yoke233/dsh-prime-agent",
    licenses = {"MIT"},
    authors = {"yoke233"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-prime-agent",

        versions = {
            ["0.2.0"] = { commit = "c36b8d7ebd688101101e70e2e3fbfb7d64bd4302" },
        },
        latest = "0.2.0",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
