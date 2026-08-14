package = {
    spec = "1",

    name = "dsh-prompt-studio",
    description = "DSH plugin: edit user and built-in system-prompt sections with live preview (Prompt Studio)",
    repo = "https://github.com/Moeblack/dsh-prompt-studio",
    homepage = "https://github.com/Moeblack/dsh-prompt-studio",
    licenses = {"BSD-3-Clause"},
    authors = {"Moeblack"},

    status = "dev",
    categories = {"dsh-plugin", "skills"},
    keywords = {"dsh", "prompt", "studio"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-prompt-studio",

        versions = {
            ["0.4.0"] = { commit = "be5e97d6ea4e882067d9f3a6385f486f7f192e92" },
        },
        latest = "0.4.0",

        needs_build = false,

        -- Published by tools/mirror.py to GitHub and GitCode, verified
        -- three ways: local build, GLOBAL and CN all hash the same.
        mirror = {
            ["0.4.0"] = {
                tarball = "dsh-prompt-studio-0.4.0.tgz",
                sha256  = "9f43b899950a28976718cba0d01b00bc29d657165eae82acc4ccf8818ec895f8",
                cn      = true,
            },
        },
    },
}
