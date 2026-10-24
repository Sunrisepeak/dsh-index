package = {
    spec = "1",

    name = "dsh-model-fusion",
    description = "Fusion for DeepSeek Harness: a frontier Lead plans and reviews, a much cheaper Sidekick writes the code — frontier results at a discount.",
    repo = "https://github.com/aa2246740/dsh-model-fusion",
    homepage = "https://github.com/aa2246740/dsh-model-fusion",
    licenses = {"Apache-2.0"},
    authors = {"aa2246740"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-model-fusion",

        versions = {
            ["0.2.5"] = { commit = "fa801662ceb11c3c92e544e83ca12e8f5936cd50" },
        },
        latest = "0.2.5",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
