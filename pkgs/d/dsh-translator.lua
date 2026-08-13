package = {
    spec = "1",

    name = "dsh-translator",
    description = "Turn DeepSeek Harness into a focused, configurable AI translation workspace.",
    repo = "https://github.com/SiYue-ZO/dsh-translator",
    homepage = "https://github.com/SiYue-ZO/dsh-translator",
    licenses = {"MIT"},
    authors = {"SiYue-ZO"},

    status = "dev",
    categories = {"dsh-plugin", "uncategorized"},
    keywords = {"dsh", "ai-translation", "translation", "translator"},

    dsh = {
        bundle_name = "dsh-translator",
        source = "github",
        origin = "SiYue-ZO/dsh-translator",

        versions = {
            ["0.2.0"] = { ref = "7ab238541380bb194478df088607d5dc5c351b77" },
        },
        latest = "0.2.0",

        needs_build = false,
        license = "MIT",

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
