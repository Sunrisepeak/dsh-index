package = {
    spec = "1",

    name = "dsh-gomoku",
    description = "在DSH中与AI下五子棋，也可以让AI对局，看哪个AI棋力更强",
    repo = "https://github.com/omdsh-dev/dsh-gomoku",
    homepage = "https://github.com/omdsh-dev/dsh-gomoku",
    licenses = {"MIT"},
    authors = {"omdsh-dev"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh", "plugin"},

    dsh = {
        bundle_name = "@deepseek-ai/dsh-gomoku",
        source = "github",
        origin = "omdsh-dev/dsh-gomoku",

        versions = {
            ["0.0.1"] = { ref = "25210233b51d5691c5ba81aa58df5932542e7a01" },
        },
        latest = "0.0.1",

        needs_build = true,
        license = "MIT",

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
