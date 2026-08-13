package = {
    spec = "1",

    name = "dsh-openpencil",
    description = "OpenPencil design preview and editing plugin for DSH",
    repo = "https://github.com/ZSeven-W/dsh-openpencil",
    homepage = "https://github.com/ZSeven-W/dsh-openpencil",
    licenses = {"MIT"},
    authors = {"ZSeven-W"},

    status = "dev",
    categories = {"dsh-plugin", "uncategorized"},
    keywords = {"dsh", "openpencil"},

    dsh = {
        bundle_name = "@zseven-w/dsh-openpencil",

        versions = {
            ["0.1.0-rc.1"] = { commit = "cd3599b56cb292401fdfc8d7f4b51b84502b83f3" },
        },
        latest = "0.1.0-rc.1",

        needs_build = false,

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
