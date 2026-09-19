package = {
    spec = "1",

    name = "dsh-imagegen",
    description = "DSH (DeepSeek Harness) Web GUI AI image generation plugin: text-to-image & image-to-image via OpenAI-compatible endpoints (gpt-image-2), with shared cross-device history.",
    repo = "https://github.com/dickpy/dsh-imagegen",
    homepage = "https://github.com/dickpy/dsh-imagegen",
    licenses = {"Apache-2.0"},
    authors = {"dickpy"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@dickpy/dsh-imagegen",

        versions = {
            ["1.0.20"] = { commit = "26e6520da8f788451338e7c31c2697fbc0c0935f" },
        },
        latest = "1.0.20",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
