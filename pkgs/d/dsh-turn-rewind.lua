package = {
    spec = "1",

    name = "dsh-turn-rewind",
    description = "deepseek harness对话回退插件 | DSH — rewind conversation and workspace state, powered by a persistent Change Ledger",
    repo = "https://github.com/Anionex/dsh-turn-rewind",
    homepage = "https://github.com/Anionex/dsh-turn-rewind",
    licenses = {"BSD-3-Clause"},
    authors = {"Anionex"},

    status = "dev",
    categories = {"dsh-plugin", "session"},
    keywords = {"dsh", "agent-rewind", "cordis-plugin", "marisa-plugin", "restore-point", "turn-rewind", "workspace-safety"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@dsh-external/turn-rewind",

        versions = {
            ["0.1.0"] = { commit = "55cf4a842a7f177cd6f42f3243603e61385e0c29" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- Published by tools/mirror.py to GitHub and GitCode, verified
        -- three ways: local build, GLOBAL and CN all hash the same.
        mirror = {
            ["0.1.0"] = {
                tarball = "dsh-turn-rewind-0.1.0.tgz",
                sha256  = "f7d3c3a28d475166e34f8414fdc26080828587f4f9162d821c8bf24c5b9dd591",
                cn      = true,
            },
        },
    },
}
