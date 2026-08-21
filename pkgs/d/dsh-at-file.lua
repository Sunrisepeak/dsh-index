package = {
    spec = "1",

    name = "dsh-at-file",
    description = "Codex-style @file mentions for DeepSeek Harness: search workspace files in the composer and attach their conte",
    repo = "https://github.com/omdsh-dev/dsh-at-file",
    homepage = "https://github.com/omdsh-dev/dsh-at-file",
    licenses = {"MIT"},
    authors = {"omdsh-dev"},

    status = "dev",
    categories = {"dsh-plugin", "tools"},
    keywords = {"dsh", "file"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-at-file",

        versions = {
            ["0.6.7"] = { commit = "c57849b27e378cf6b41d082b17c8a8750cee370f" },
            ["0.6.5"] = { commit = "289f19bb83f80a95df49f567eeef42462d4da92f" },
            ["0.6.3"] = { commit = "898369ece56ae6ec41afd8e014f187bb5b723409" },
            ["0.6.2"] = { commit = "4bc90873ae188bcdf55534ff8fd3071e88f192e4" },
            ["0.6.0"] = { commit = "9c71e52c483ae589c7979b6ffc8b3a2cd5d8efa4" },
            ["0.1.0"] = { commit = "3c8408e8df06ebbd7126d1d7ebcf897ec92a3b86" },
        },
        latest = "0.6.7",

        needs_build = false,

        -- Published by tools/mirror.py to GitHub and GitCode, verified
        -- three ways: local build, GLOBAL and CN all hash the same.
        mirror = {
            ["0.1.0"] = {
                tarball = "dsh-at-file-0.1.0.tgz",
                sha256  = "05e3d0154a8ddcfb82de6cfbe2430f5cfcf5f27b2c8b4ef61da08fdb96d1c184",
                cn      = true,
            },
        },
    },
}
