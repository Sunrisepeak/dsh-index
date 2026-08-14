package = {
    spec = "1",

    name = "dsh-tool-somark",
    description = "SoMark document parser tool (somark_parse) plugin for DeepSeek Harness",
    repo = "https://github.com/saurtone/dsh-tool-somark",
    homepage = "https://github.com/saurtone/dsh-tool-somark",
    authors = {"saurtone"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-tool-somark",

        versions = {
            ["0.1.0"] = { commit = "a5bcaa823da7ffd65e3c44cdc03962b8db947d85" },
        },
        latest = "0.1.0",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
