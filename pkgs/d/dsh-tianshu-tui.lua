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
        bundle_name = "@huiliyi37/dsh-tianshu-tui",

        versions = {
            ["0.1.0-rc.6"] = { commit = "47908f40599a45c16275ec1adeae60cb29f903b5" },
        },
        latest = "0.1.0-rc.6",

        needs_build = false,

        -- Published by tools/mirror.py to GitHub and GitCode, verified
        -- three ways: local build, GLOBAL and CN all hash the same.
        mirror = {
            ["0.1.0-rc.6"] = {
                tarball = "dsh-tianshu-tui-0.1.0-rc.6.tgz",
                sha256  = "150436031a9708396a7e7875270a8609ac7d989568fc455bec7e4cfaea9e7603",
                cn      = true,
            },
        },
    },
}
