package = {
    spec = "1",

    name = "dsh-fun-weather",
    description = "DSH weather tab and weather-following themes powered by Open-Meteo",
    repo = "https://github.com/omdsh-dev/dsh-fun-weather",
    homepage = "https://github.com/omdsh-dev/dsh-fun-weather",
    licenses = {"BSD-3-Clause"},
    authors = {"omdsh-dev"},

    status = "dev",
    categories = {"dsh-plugin", "fun"},
    keywords = {"dsh", "fun", "weather"},

    dsh = {
        bundle_name = "@deepseek-ai/dsh-fun-weather",

        versions = {
            ["0.1.0"] = { commit = "efe1bec16889571f5e67bc7118163b0435768101" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
