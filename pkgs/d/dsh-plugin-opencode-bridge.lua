package = {
    spec = "1",

    name = "dsh-plugin-opencode-bridge",
    description = "Bridge opencode skills and config into DeepSeek Harness",
    repo = "https://github.com/YYTbit/dsh-plugin-opencode-bridge",
    homepage = "https://github.com/YYTbit/dsh-plugin-opencode-bridge",
    licenses = {"MIT"},
    authors = {"YYTbit"},

    status = "dev",
    categories = {"dsh-plugin", "skills"},
    keywords = {"dsh", "opencode"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-plugin-opencode-bridge",

        versions = {
            ["0.1.1"] = { commit = "87327a2847092794057721187adb1e980414110b" },
            ["0.1.0"] = { commit = "27ec22d8080ca5bbff3df91acb30dd2bb6b088e3" },
        },
        latest = "0.1.1",

        needs_build = true,

        -- Published by tools/mirror.py to GitHub and GitCode, verified
        -- three ways: local build, GLOBAL and CN all hash the same.
        mirror = {
            ["0.1.0"] = {
                tarball = "dsh-plugin-opencode-bridge-0.1.0.tgz",
                sha256  = "5549e915398d29197667258b3504bd635050592dd97ead933bcd3c70bf8318d6",
                cn      = true,
            },
        },
    },
}
