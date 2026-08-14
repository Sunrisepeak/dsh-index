package = {
    spec = "1",

    name = "openflowframes",
    description = "dsh plugin from ZeroHackz/OpenFlowFrames",
    repo = "https://github.com/ZeroHackz/OpenFlowFrames",
    homepage = "https://github.com/ZeroHackz/OpenFlowFrames",
    licenses = {"GPL-3.0"},
    authors = {"ZeroHackz"},

    status = "dev",
    categories = {"dsh-plugin", "uncategorized"},
    keywords = {"dsh", "openflowframes"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@zerohackz/dsh-openflowframes",

        versions = {
            ["0.1.0"] = { commit = "f9b5087291a691dc02444b7d9dcff05033905a4d" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- Published by tools/mirror.py to GitHub and GitCode, verified
        -- three ways: local build, GLOBAL and CN all hash the same.
        mirror = {
            ["0.1.0"] = {
                tarball = "openflowframes-0.1.0.tgz",
                sha256  = "19b14859142d998f85e07751b74711de3765e30efe18abb1baee1616ff3921e0",
                cn      = true,
            },
        },
    },
}
