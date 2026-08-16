package = {
    spec = "1",

    name = "dsh-ballute",
    description = "Crash protection for DeepSeek Harness plugins: crash cards with one-click disable, pre-flight static inspection, black-box telemetry, and a safe-mode rescue profile",
    repo = "https://github.com/Zlyraz/dsh-ballute",
    homepage = "https://github.com/Zlyraz/dsh-ballute",
    authors = {"Zlyraz"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh", "crash-protection", "reliability"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-ballute",

        versions = {
            ["0.1.0"] = { commit = "a7a9bfcdf8a9b4f34f5da70871a72c3cdf1b0d70" },
        },
        latest = "0.1.0",

        needs_build = false,
    },
}
