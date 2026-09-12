package = {
    spec = "1",

    name = "dsh-permission-rules",
    description = "Claude Code-style declarative permission rules for DeepSeek Harness: ordered allow/deny/ask rules with tool-name, argument (glob/regex), and workspace-path matching on the tools/pre-execute waterfall, session-log audit, and HMR reload.",
    repo = "https://github.com/PerryLink/dsh-permission-rules",
    homepage = "https://github.com/PerryLink/dsh-permission-rules",
    licenses = {"Apache-2.0"},
    authors = {"PerryLink"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-permission-rules",

        versions = {
            ["0.5.1"] = { commit = "35f9721e8e0e956cec6fd7934aba820315675fe6" },
        },
        latest = "0.5.1",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
