package = {
    spec = "1",

    name = "forkprobe",
    description = "Compare multiple skills on the same task and pick the winner.",
    repo = "https://github.com/Jayden-X-L/forkprobe",
    homepage = "https://github.com/Jayden-X-L/forkprobe",
    licenses = {"MIT"},
    authors = {"Jayden-X-L"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "forkprobe-dsh",

        versions = {
            ["1.1.0"] = { commit = "707d02b5a03c280237bb6d602bd8f1d09accf13e" },
            ["0.10.0"] = { commit = "defe0b47e0d69c12ce586d4d85bfe4f3ec34edd3" },
        },
        latest = "1.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
