package = {
    spec = "1",

    name = "dsh-toolbox-ui",
    description = "Toolbox panel for DeepSeek Harness Web: MCP manager (tools & JSON Schema, market, import, workspace copy) and skills manager (scopes & shadowing, enable/disable, model auto-invocation, skillhub.cn market).",
    repo = "https://github.com/Imzl-zl/dsh-toolbox-ui",
    homepage = "https://github.com/Imzl-zl/dsh-toolbox-ui",
    licenses = {"MIT"},
    authors = {"Imzl-zl"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-toolbox-ui",

        versions = {
            ["1.7.2"] = { commit = "3c2a26d1de27bfba2b1b1ad7fcc9c1d431b8ac4c" },
        },
        latest = "1.7.2",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
