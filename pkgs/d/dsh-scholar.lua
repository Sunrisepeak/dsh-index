package = {
    spec = "1",

    name = "dsh-scholar",
    description = "dsh-scholar",
    repo = "https://github.com/lzszq/dsh-scholar",
    homepage = "https://github.com/lzszq/dsh-scholar",
    licenses = {"MIT"},
    authors = {"lzszq"},

    status = "dev",
    categories = {"dsh-plugin", "uncategorized"},
    keywords = {"dsh", "scholar"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@dsh-scholar/research-plugin",

        versions = {
            ["0.1.0"] = { commit = "fda808dfda243cbf431c1f83e2699223c4c4e08a" },
        },
        latest = "0.1.0",

        needs_build = true,

        -- Published by tools/mirror.py to GitHub and GitCode, verified
        -- three ways: local build, GLOBAL and CN all hash the same.
        mirror = {
            ["0.1.0"] = {
                tarball = "dsh-scholar-0.1.0.tgz",
                sha256  = "37cc9bea5636e1075bb54175d354ee560369fcf1cab554e7fb4eff4f4f7e571c",
                cn      = true,
            },
        },
    },
}
