package = {
    spec = "1",

    name = "dsh-ios",
    description = "DeepSeek Harness (DSH) plugin: a live iOS Simulator — and a USB-connected iPhone — inside the conversation. 21 agent tools for booting, building, driving the UI by accessibility identity, OCR text or list rows, plus a streaming sidebar panel you can tap and drag on.",
    repo = "https://github.com/ZSeven-W/dsh-ios",
    homepage = "https://github.com/ZSeven-W/dsh-ios",
    licenses = {"MIT"},
    authors = {"ZSeven-W"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@zseven-w/dsh-ios",

        versions = {
            ["0.1.0-rc.1"] = { commit = "e8d94c39d348e2c38b10d0b4ae24bfe005515c97" },
        },
        latest = "0.1.0-rc.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
