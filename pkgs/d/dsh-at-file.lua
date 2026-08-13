package = {
    spec = "1",

    name = "dsh-at-file",
    description = "Codex-style @file mentions for DeepSeek Harness: search workspace files in the composer and attach their conte",
    repo = "https://github.com/omdsh-dev/dsh-at-file",
    homepage = "https://github.com/omdsh-dev/dsh-at-file",
    licenses = {"MIT"},
    authors = {"omdsh-dev"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh", "plugin"},

    dsh = {
        bundle_name = "dsh-at-file",
        source = "github",
        origin = "omdsh-dev/dsh-at-file",

        versions = {
            ["0.1.0"] = { ref = "3c8408e8df06ebbd7126d1d7ebcf897ec92a3b86" },
        },
        latest = "0.1.0",

        needs_build = false,
        license = "MIT",

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
