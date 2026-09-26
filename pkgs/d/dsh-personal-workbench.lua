package = {
    spec = "1",

    name = "dsh-personal-workbench",
    description = "DSH 个人工作台：日历 + 任务列表 + AI 澄清/拆解/执行/复盘 | Personal workbench for DeepSeek Harness Web: calendar + task list + AI assistant",
    repo = "https://github.com/Dely0/dsh-personal-workbench",
    homepage = "https://github.com/Dely0/dsh-personal-workbench",
    licenses = {"MIT"},
    authors = {"Dely0"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@dely0/dsh-personal-workbench",

        versions = {
            ["1.9.0"] = { commit = "8be8ca2cfc4bc6fb5635182aa3c708dbe4ab02bc" },
        },
        latest = "1.9.0",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
