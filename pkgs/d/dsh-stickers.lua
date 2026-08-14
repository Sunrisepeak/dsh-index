package = {
    spec = "1",

    name = "dsh-stickers",
    description = "DSH WebUI sticker plugin for bidirectional user and agent reactions",
    repo = "https://github.com/william-jin-cmu/dsh-stickers",
    homepage = "https://github.com/william-jin-cmu/dsh-stickers",
    licenses = {"BSD-3-Clause"},
    authors = {"william-jin-cmu"},

    status = "dev",
    categories = {"dsh-plugin", "web-ui"},
    keywords = {"dsh", "stickers"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@dsh-external/dsh-stickers",

        versions = {
            ["0.1.0"] = { commit = "1703f09915db1058b6031b31e52fd404560e0a78" },
        },
        latest = "0.1.0",

        needs_build = true,

        -- Published by tools/mirror.py to GitHub and GitCode, verified
        -- three ways: local build, GLOBAL and CN all hash the same.
        mirror = {
            ["0.1.0"] = {
                tarball = "dsh-stickers-0.1.0.tgz",
                sha256  = "1dfd32ce490684e201d123482d60abd68e2715b0708fa6a40769f345bbf77abb",
                cn      = true,
            },
        },
    },
}
