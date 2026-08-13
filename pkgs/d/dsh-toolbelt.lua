package = {
    spec = "1",

    name = "dsh-toolbelt",
    description = "Eight DeepSeek Harness plugins: persona, language guard, per-request vision fallback, python/windows write gua",
    repo = "https://github.com/cking000bigdemon/dsh-toolbelt",
    homepage = "https://github.com/cking000bigdemon/dsh-toolbelt",
    licenses = {"MIT"},
    authors = {"cking000bigdemon"},

    status = "dev",
    categories = {"dsh-plugin", "vision", "skills"},
    keywords = {"dsh", "ai-agent", "cordis"},

    dsh = {
        bundle_name = "dsh-toolbelt",
        source = "github",
        origin = "cking000bigdemon/dsh-toolbelt",

        versions = {
            ["0.1.0"] = { ref = "a624376404f75fe7d1c1cd1dd0ac44e04cac519f" },
        },
        latest = "0.1.0",

        needs_build = true,
        license = "MIT",

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
