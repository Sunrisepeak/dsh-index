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

        -- Published by tools/mirror.py to GitHub and GitCode, verified
        -- three ways: local build, GLOBAL and CN all hash the same.
        mirror = {
            ["0.1.0"] = {
                tarball = "dsh-share-0.1.0.tgz",
                sha256  = "d466871696191341b1cc88227a8464aaaa0225fe197d87ed4b34ca1714713ca8",
                cn      = true,
            },
        },
    },
}
