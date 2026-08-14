package = {
    spec = "1",

    name = "dsh-tailscale-sync",
    description = "Zero-config Tailscale sync for DeepSeek Harness (dsh-plugin). 零配置：在手机上继续电脑端 DeepSeek Harness 的工作。",
    repo = "https://github.com/MoonGlassKitty/dsh-tailscale-sync",
    homepage = "https://github.com/MoonGlassKitty/dsh-tailscale-sync",
    licenses = {"MIT"},
    authors = {"MoonGlassKitty"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-tailscale-sync",

        versions = {
            ["1.0.0"] = { commit = "bb54ac93063bebb4f17147a94b64ab0a6ca901b3" },
        },
        latest = "1.0.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
