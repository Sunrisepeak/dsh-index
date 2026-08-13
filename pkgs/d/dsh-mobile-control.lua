package = {
    spec = "1",

    name = "dsh-mobile-control",
    description = "DSH plugin for controlling mobile devices (ADB/iOS) — DeepSeek Harness 操控手机插件",
    repo = "https://github.com/PangYiMing/dsh-mobile-control",
    homepage = "https://github.com/PangYiMing/dsh-mobile-control",
    licenses = {"MIT"},
    authors = {"PangYiMing"},

    status = "dev",
    categories = {"dsh-plugin", "uncategorized"},
    keywords = {"dsh", "mobile-automation", "mobile-control"},

    dsh = {
        bundle_name = "dsh-mobile-control",

        versions = {
            ["0.1.0"] = { commit = "a72f381cf9211bd79d035e0fa2b25087896df390" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
