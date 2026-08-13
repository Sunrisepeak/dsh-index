package = {
    spec = "1",

    name = "dsh-fun-weather",
    description = "DSH weather tab and weather-following themes powered by Open-Meteo",
    repo = "https://github.com/omdsh-dev/dsh-fun-weather",
    homepage = "https://github.com/omdsh-dev/dsh-fun-weather",
    licenses = {"BSD-3-Clause"},
    authors = {"omdsh-dev"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh", "plugin"},

    dsh = {
        bundle_name = "@deepseek-ai/dsh-fun-weather",
        source = "github",
        origin = "omdsh-dev/dsh-fun-weather",

        versions = {
            ["0.1.0"] = { ref = "efe1bec16889571f5e67bc7118163b0435768101" },
        },
        latest = "0.1.0",

        needs_build = false,
        license = "BSD-3-Clause",

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
