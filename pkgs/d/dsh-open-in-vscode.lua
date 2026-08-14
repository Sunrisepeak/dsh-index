package = {
    spec = "1",

    name = "dsh-open-in-vscode",
    description = "Open DeepSeek Harness workspace directories in VS Code directly from the web GUI.",
    repo = "https://github.com/omdsh-dev/dsh-open-in-vscode",
    homepage = "https://github.com/omdsh-dev/dsh-open-in-vscode",
    licenses = {"MIT"},
    authors = {"omdsh-dev"},

    status = "dev",
    categories = {"dsh-plugin", "uncategorized"},
    keywords = {"dsh", "open", "vscode"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-open-in-vscode",

        versions = {
            ["0.1.5"] = { commit = "149f21aed3d05d2b392206394c4a023e35d694c7" },
        },
        latest = "0.1.5",

        needs_build = false,

        -- Published by tools/mirror.py to GitHub and GitCode, verified
        -- three ways: local build, GLOBAL and CN all hash the same.
        mirror = {
            ["0.1.5"] = {
                tarball = "dsh-open-in-vscode-0.1.5.tgz",
                sha256  = "ac1c4e9af1ad2276fe0c16ca6fb313a88e41277502b60f534154a8658605601f",
                cn      = true,
            },
        },
    },
}
