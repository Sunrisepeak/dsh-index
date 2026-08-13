package = {
    spec = "1",

    name = "dsh-daily-fortune",
    description = "DSH daily fortune plugin with Guan Yin lots, Tarot spreads, and daily quotes",
    repo = "https://github.com/omdsh-dev/dsh-daily-fortune",
    homepage = "https://github.com/omdsh-dev/dsh-daily-fortune",
    licenses = {"BSD-3-Clause"},
    authors = {"omdsh-dev"},

    status = "dev",
    categories = {"dsh-plugin", "uncategorized"},
    keywords = {"dsh", "daily", "fortune"},

    dsh = {
        bundle_name = "@deepseek-ai/dsh-daily-fortune",
        source = "github",
        origin = "omdsh-dev/dsh-daily-fortune",

        versions = {
            ["0.1.0"] = { ref = "a7cac9358a443be9b2b40bdcf56e0a14d67f9be7" },
        },
        latest = "0.1.0",

        needs_build = false,
        license = "BSD-3-Clause",

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
