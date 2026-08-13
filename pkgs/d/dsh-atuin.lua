package = {
    spec = "1",

    name = "dsh-atuin",
    description = "dsh atuin-history: record dsh user prompts into atuin shell history",
    repo = "https://github.com/RealAlexandreAI/dsh-atuin",
    homepage = "https://github.com/RealAlexandreAI/dsh-atuin",
    licenses = {"MIT"},
    authors = {"RealAlexandreAI"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh", "plugin"},

    dsh = {
        bundle_name = "dsh-atuin",
        source = "github",
        origin = "RealAlexandreAI/dsh-atuin",

        versions = {
            ["0.1.0"] = { ref = "72a43d92bb81be12dedabafddf7d9855286f448a" },
        },
        latest = "0.1.0",

        needs_build = false,
        license = "MIT",

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
