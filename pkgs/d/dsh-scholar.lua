package = {
    spec = "1",

    name = "dsh-scholar",
    description = "dsh-scholar",
    repo = "https://github.com/lzszq/dsh-scholar",
    homepage = "https://github.com/lzszq/dsh-scholar",
    licenses = {"MIT"},
    authors = {"lzszq"},

    status = "dev",
    categories = {"dsh-plugin", "uncategorized"},
    keywords = {"dsh", "scholar"},

    dsh = {
        bundle_name = "@dsh-scholar/research-plugin",

        versions = {
            ["0.1.0"] = { commit = "fda808dfda243cbf431c1f83e2699223c4c4e08a" },
        },
        latest = "0.1.0",

        needs_build = true,

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
