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
            ["0.1.0"] = { commit = "933e7e8686e958e1c75b922fc5fd609135fcbf3e" },
        },
        latest = "0.1.0",

        needs_build = false,
    },
}
