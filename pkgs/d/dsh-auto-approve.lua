package = {
    spec = "1",

    name = "dsh-auto-approve",
    description = "为 DeepSeek Harness 增加介于 Workspace Write 与 Full access 之间的自动批准权限档，危险或不确定操作仍转人工审批。An auto-approval permission preset between workspace-write and full access for DeepSeek Harness.",
    repo = "https://github.com/Jiao-XXX/dsh-auto-approve",
    homepage = "https://github.com/Jiao-XXX/dsh-auto-approve",
    licenses = {"MIT"},
    authors = {"Jiao-XXX"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-auto-approve",

        versions = {
            ["0.5.1"] = { commit = "3734c1756f134724e5428d88c1525da02e6fba5e" },
        },
        latest = "0.5.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
