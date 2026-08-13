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
        bundle_name = "dsh-at-file",

        versions = {
            ["0.1.0"] = { commit = "3c8408e8df06ebbd7126d1d7ebcf897ec92a3b86" },
        },
        latest = "0.1.0",

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
