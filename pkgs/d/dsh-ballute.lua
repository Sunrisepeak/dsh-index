package = {
    spec = "1",

    name = "dsh-ballute",
    description = "Crash protection for DeepSeek Harness plugins: crash cards with one-click disable, pre-flight static inspection, black-box telemetry, and a safe-mode rescue profile",
    repo = "https://github.com/Zlyraz/dsh-ballute",
    homepage = "https://github.com/Zlyraz/dsh-ballute",
    licenses = {"MIT"},
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
            ["0.1.0"] = { commit = "017c2403672d74ceaddb34029b70af032b84e9ad" },
            ["0.1.1"] = { commit = "68e4b07bb108bdad7cdb782d0b2ce15755356526" },
        },
        latest = "0.1.1",

        needs_build = false,
    },
}
