package = {
    spec = "1",

    name = "dsh-kb-sieve",
    description = "DSH knowledge-base plugin: build audit-able KB packs (references + SQLite FTS5) from md/txt/docx/pdf, determin",
    repo = "https://github.com/omdsh-dev/dsh-kb-sieve",
    homepage = "https://github.com/omdsh-dev/dsh-kb-sieve",
    licenses = {"Apache-2.0"},
    authors = {"omdsh-dev"},

    status = "dev",
    categories = {"dsh-plugin", "memory"},
    keywords = {"dsh", "sieve"},

    dsh = {
        bundle_name = "@dsh-external/dsh-kb-sieve",

        versions = {
            ["0.1.0"] = { commit = "01aba653f576658974b70514573c1f6b7b4ce4df" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
