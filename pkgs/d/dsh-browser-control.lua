package = {
    spec = "1",

    name = "dsh-browser-control",
    description = "DSH plugin for controlling browsers (CDP/Playwright) — DeepSeek Harness 操控浏览器插件",
    repo = "https://github.com/PangYiMing/dsh-browser-control",
    homepage = "https://github.com/PangYiMing/dsh-browser-control",
    licenses = {"MIT"},
    authors = {"PangYiMing"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh", "plugin"},

    dsh = {
        bundle_name = "dsh-browser-control",
        source = "github",
        origin = "PangYiMing/dsh-browser-control",

        versions = {
            ["0.1.0"] = { ref = "5a4359c0ae4632d02b37cfb2e920a71a7642b15b" },
        },
        latest = "0.1.0",

        needs_build = false,
        license = "MIT",

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
