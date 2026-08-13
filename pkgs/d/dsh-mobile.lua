package = {
    spec = "1",

    name = "dsh-mobile",
    description = "dsh plugin from lehhair/dsh-mobile",
    repo = "https://github.com/lehhair/dsh-mobile",
    homepage = "https://github.com/lehhair/dsh-mobile",
    licenses = {"BSD-3-Clause"},
    authors = {"lehhair"},

    status = "dev",
    categories = {"dsh-plugin", "uncategorized"},
    keywords = {"dsh", "mobile"},

    dsh = {
        bundle_name = "@dsh-external/dsh-mobile",
        source = "github",
        origin = "lehhair/dsh-mobile",

        versions = {
            ["0.1.0"] = { ref = "25764098e335d56b4980e3f6b0a0b16dcdcd341f" },
        },
        latest = "0.1.0",

        needs_build = false,
        license = "BSD-3-Clause",

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
