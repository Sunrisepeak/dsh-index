package = {
    spec = "1",

    name = "dsh-testgen",
    description = "Automated unit-test generation for DeepSeek Harness: /testgen command + generate_tests tool that scaffold, run, and fix unit tests until they pass.",
    repo = "https://github.com/bujue600-arch/dsh-testgen",
    homepage = "https://github.com/bujue600-arch/dsh-testgen",
    licenses = {"MIT"},
    authors = {"bujue600-arch"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-testgen",

        versions = {
            ["1.0.0"] = { commit = "1730f3927342dbbe75e981d81a0d64ae76a1f245" },
        },
        latest = "1.0.0",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
