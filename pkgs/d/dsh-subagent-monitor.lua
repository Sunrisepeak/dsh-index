package = {
    spec = "1",

    name = "dsh-subagent-monitor",
    description = "dsh-subagent-monitor",
    repo = "https://github.com/Mombrane/dsh-subagent-monitor",
    homepage = "https://github.com/Mombrane/dsh-subagent-monitor",
    licenses = {"MIT"},
    authors = {"Mombrane"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@leetoners/dsh-ui-subagent-monitor",

        versions = {
            ["0.2.0"] = { commit = "64022927d6ebe4caa7767f9c16db8cdcb96723e4" },
        },
        latest = "0.2.0",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
