package = {
    spec = "1",

    name = "dsh-plugin-aflare",
    description = "aflare workflow tools for DeepSeek Harness: generate, validate, and run local-first deterministic YAML workflows",
    repo = "https://github.com/alib8b8/dsh-plugin-aflare",
    homepage = "https://github.com/alib8b8/aflare",
    licenses = {"AGPL-3.0"},
    authors = {"alib8b8"},

    status = "dev",
    categories = {"dsh-plugin", "workflow", "tools"},
    keywords = {"dsh", "aflare", "workflow", "automation", "agent"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@alib8b8/dsh-plugin-aflare",

        versions = {
            ["0.1.0"] = { commit = "5e4811318ef2d82c5b0e2a3b4e1c84e7789c6df2" },
        },
        latest = "0.1.0",

        needs_build = false,
    },
}
