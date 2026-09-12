package = {
    spec = "1",

    name = "garmin-connect-plugin-for-dsh",
    description = "DeepSeek Harness plugin for Garmin Connect — AI-powered fitness data access",
    repo = "https://github.com/Likenttt/garmin-connect-plugin-for-dsh",
    homepage = "https://github.com/Likenttt/garmin-connect-plugin-for-dsh",
    licenses = {"MIT"},
    authors = {"Likenttt"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-plugin-garmin-connect",

        versions = {
            ["0.1.5"] = { commit = "3427b06cf684d49026a61c0351444603871e9959" },
        },
        latest = "0.1.5",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
