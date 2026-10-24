package = {
    spec = "1",

    name = "huaweicloud-devkit",
    description = "Official Huawei Cloud plugin for AI agents — skills, MCP tools, safety guardrails, and cloud sandbox to help AI agents build, deploy, and operate on Huawei Cloud securely.",
    repo = "https://github.com/huaweicloud/huaweicloud-devkit",
    homepage = "https://github.com/huaweicloud/huaweicloud-devkit",
    licenses = {"Apache-2.0"},
    authors = {"huaweicloud"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "huaweicloud-devkit",

        versions = {
            ["1.1.0"] = { commit = "bcefb32fc5f1d978aadca16f614fd56412764604" },
        },
        latest = "1.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
