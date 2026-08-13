package = {
    spec = "1",

    name = "dsh-pet-corner",
    description = "DSH Pet Corner: a floating pet, keyless pet-image proxy, favorites, and plugin-owned settings API",
    repo = "https://github.com/omdsh-dev/dsh-pet-corner",
    homepage = "https://github.com/omdsh-dev/dsh-pet-corner",
    licenses = {"BSD-3-Clause"},
    authors = {"omdsh-dev"},

    status = "dev",
    categories = {"dsh-plugin", "vision", "provider"},
    keywords = {"dsh", "pet", "corner"},

    dsh = {
        bundle_name = "@deepseek-ai/dsh-pet-corner",
        source = "github",
        origin = "omdsh-dev/dsh-pet-corner",

        versions = {
            ["0.0.1-rc.3"] = { ref = "986739867546b5539083aaf638f54249cd8f5347" },
        },
        latest = "0.0.1-rc.3",

        needs_build = false,
        license = "BSD-3-Clause",

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
