package = {
    spec = "1",

    name = "dsh-weather",
    description = "Weather tool for DeepSeek Harness: current conditions and multi-day forecasts via Open-Meteo (free, no API key)",
    repo = "https://github.com/sunshine-lang/dsh-weather",
    homepage = "https://github.com/sunshine-lang/dsh-weather",
    licenses = {"MIT"},
    authors = {"sunshine-lang"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-weather",

        versions = {
            ["0.1.0"] = { commit = "9f85d87ac58402d5864aa7bdbd8346c136589458" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
