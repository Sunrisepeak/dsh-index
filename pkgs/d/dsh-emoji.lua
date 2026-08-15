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
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@dsh-external/dsh-emoji",

        versions = {
            ["0.2.2-beta.1"] = { commit = "1cc7201076e15b014ac5363772d4c8ef1137aa00" },
            ["0.2.0"] = { commit = "254daf2253e41ed136cb340b0ca5390493bb7b74" },
        },
        latest = "0.2.2-beta.1",

        needs_build = false,

        -- Published by tools/mirror.py to GitHub and GitCode, verified
        -- three ways: local build, GLOBAL and CN all hash the same.
        mirror = {
            ["0.2.0"] = {
                tarball = "dsh-emoji-0.2.0.tgz",
                sha256  = "a626d86479a24d78f6be2850674fe171ca711a8257ea739462cb22501190c8bd",
                cn      = true,
            },
        },
    },
}
