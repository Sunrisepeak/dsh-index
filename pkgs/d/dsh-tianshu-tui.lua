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
        source = "github",
        origin = "huiliyi37/dsh-tianshu-tui",

        versions = {
            ["0.1.0-rc.6"] = { ref = "47908f40599a45c16275ec1adeae60cb29f903b5" },
        },
        latest = "0.1.0-rc.6",

        needs_build = false,
        license = "Apache-2.0",

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
