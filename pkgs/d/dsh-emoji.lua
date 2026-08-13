package = {
    spec = "1",

    name = "dsh-emoji",
    description = "为AI回复自动添加表情的插件",
    repo = "https://github.com/hellodigua/dsh-emoji",
    homepage = "https://github.com/hellodigua/dsh-emoji",
    licenses = {"MIT"},
    authors = {"hellodigua"},

    status = "dev",
    categories = {"dsh-plugin", "web-ui"},
    keywords = {"dsh", "emoji"},

    dsh = {
        bundle_name = "@dsh-external/dsh-emoji",

        versions = {
            ["0.2.0"] = { commit = "254daf2253e41ed136cb340b0ca5390493bb7b74" },
        },
        latest = "0.2.0",

        needs_build = false,

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
