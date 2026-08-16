package = {
    spec = "1",

    name = "dsh-tianshu-tui",
    description = "dsh-tianshu-tui — DeepSeek Harness terminal UI",
    repo = "https://github.com/huiliyi37/dsh-tianshu-tui",
    homepage = "https://github.com/huiliyi37/dsh-tianshu-tui",
    licenses = {"Apache-2.0"},
    authors = {"huiliyi37"},

    status = "dev",
    categories = {"dsh-plugin", "tui"},
    keywords = {"dsh", "harness-engineering"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "tui",

        bundle_name = "@huiliyi37/dsh-tianshu-tui",

        versions = {
            ["0.1.2-rc.8"] = { commit = "cf0987b2ddf2ebffb553b58452ddeea2c3a3d8ed" },
            ["0.1.2-rc.6"] = { commit = "7e2a6a86fb569b6e6f412f62f91768518dc22855" },
            ["0.1.1-rc.6"] = { commit = "95ea545aac764ef7fc3dcdfe23c086d6f99a30fb" },
            ["0.1.0-rc.6"] = { commit = "47908f40599a45c16275ec1adeae60cb29f903b5" },
        },
        latest = "0.1.2-rc.8",

        needs_build = false,

        -- Published by tools/mirror.py to GitHub and GitCode, verified
        -- three ways: local build, GLOBAL and CN all hash the same.
        mirror = {
            ["0.1.1-rc.6"] = {
                tarball = "dsh-tianshu-tui-0.1.1-rc.6.tgz",
                sha256  = "b8e20b1daef76588fb61a7c869655e4b79962bfa40d03e647ff0d1d134a2cd12",
                cn      = true,
            },
            ["0.1.0-rc.6"] = {
                tarball = "dsh-tianshu-tui-0.1.0-rc.6.tgz",
                sha256  = "150436031a9708396a7e7875270a8609ac7d989568fc455bec7e4cfaea9e7603",
                cn      = true,
            },
        },
    },
}
