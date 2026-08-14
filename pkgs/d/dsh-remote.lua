package = {
    spec = "1",

    name = "dsh-remote",
    description = "Remote-work assistant for DeepSeek Harness (DSH): connect via SSH (key or password), pick a remote workspace, operate with rw_* tools, and SFTP-mirror it into a real local DSH workspace.",
    repo = "https://github.com/flymysql/dsh-remote",
    homepage = "https://github.com/flymysql/dsh-remote",
    licenses = {"MIT"},
    authors = {"flymysql"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-remote",

        versions = {
            ["0.5.2"] = { commit = "33093e52617597f3c067f4060cb9867291c2d6d8" },
        },
        latest = "0.5.2",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
