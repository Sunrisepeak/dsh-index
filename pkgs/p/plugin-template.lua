package = {
    spec = "1",

    name = "plugin-template",
    description = "基于原turtle ui官方仓库创建的plugin模板仓库",
    repo = "https://github.com/omdsh-dev/plugin-template",
    homepage = "https://github.com/omdsh-dev/plugin-template",
    licenses = {"BSD-3-Clause"},
    authors = {"omdsh-dev"},

    status = "dev",
    categories = {"dsh-plugin", "uncategorized"},
    keywords = {"dsh", "plugin", "template"},

    dsh = {
        bundle_name = "@your-scope/dsh-plugin-template",

        versions = {
            ["0.0.1"] = { commit = "68e1a7dce77471d0850c2c8e4e68d508be885917" },
        },
        latest = "0.0.1",

        needs_build = true,

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
