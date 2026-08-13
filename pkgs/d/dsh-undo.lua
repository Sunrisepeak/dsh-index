package = {
    spec = "1",

    name = "dsh-undo",
    description = "Context undo/redo plugin for DeepSeek Harness (dsh): roll the model context back to the last completed step an",
    repo = "https://github.com/LingLambda/dsh-undo",
    homepage = "https://github.com/LingLambda/dsh-undo",
    licenses = {"MIT"},
    authors = {"LingLambda"},

    status = "dev",
    categories = {"dsh-plugin", "uncategorized"},
    keywords = {"dsh", "undo"},

    dsh = {
        bundle_name = "dsh-undo",

        versions = {
            ["0.1.1"] = { commit = "3a5f085fac5d9ca161515ed4f7e233bf2dd23505" },
        },
        latest = "0.1.1",

        needs_build = true,

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
