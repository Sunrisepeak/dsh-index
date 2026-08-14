package = {
    spec = "1",

    name = "dsh-commit-review",
    description = "一个 DSH 插件：为 Web GUI 增加 /commit 与 /review 两个斜杠命令",
    repo = "https://github.com/the-qian/dsh-commit-review",
    homepage = "https://github.com/the-qian/dsh-commit-review",
    licenses = {"MIT"},
    authors = {"the-qian"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-commit-review",

        versions = {
            ["0.1.0"] = { commit = "40a21f0a160939d28822d77dd12d639731d7fc61" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
