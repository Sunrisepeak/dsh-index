package = {
    spec = "1",

    name = "dsh-vision-sidecar",
    description = "Hosted free vision sidecar for DeepSeek Harness with durable session evidence",
    repo = "https://github.com/121103qwq/dsh-vision-sidecar",
    homepage = "https://github.com/121103qwq/dsh-vision-sidecar",
    licenses = {"MIT"},
    authors = {"121103qwq"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-vision-sidecar",

        versions = {
            ["0.1.4"] = { commit = "bf020d8acfb9bea251f9ab9f5a8978d395d41805" },
        },
        latest = "0.1.4",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
