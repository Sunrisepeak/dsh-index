package = {
    spec = "1",

    name = "dsh-share",
    description = "dsh对话分享插件，一键分享你的对话",
    repo = "https://github.com/hellodigua/dsh-share",
    homepage = "https://github.com/hellodigua/dsh-share",
    licenses = {"MIT"},
    authors = {"hellodigua"},

    status = "dev",
    categories = {"dsh-plugin", "session"},
    keywords = {"dsh", "share"},

    dsh = {
        bundle_name = "@dsh-external/dsh-share",

        versions = {
            ["0.1.0"] = { commit = "f692d83541421fbdf28f97970e7a1a67846ce7fa" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
