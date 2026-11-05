package = {
    spec = "1",

    name = "dsh-git-panel",
    description = "Web GUI 里的 IDE 风格 Git 面板——分支/提交历史总览、变更提交与 amend、AI 生成提交信息、文件浏览、代码与图片新旧差异对照、输入框分支标记、针对移动端优化 | an IDE-style Git panel for the Web GUI — branches & history, commit/amend for local changes, AI-generated commit messages, a file browser, code & image before/after diffs, an input-bar branch marker, optimized for mobile",
    repo = "https://github.com/xbzbing/dsh-git-panel",
    homepage = "https://github.com/xbzbing/dsh-git-panel",
    licenses = {"MIT"},
    authors = {"xbzbing"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@xbzbing/dsh-git-panel",

        versions = {
            ["1.11.2"] = { commit = "dd32d8aaf1a651e5039c8103194681b82f46791a" },
        },
        latest = "1.11.2",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
