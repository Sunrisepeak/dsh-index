package = {
    spec = "1",

    name = "dsh-git-identity",
    description = "DSH 插件：git 提交固定使用环境自身作者身份（优先 gh CLI 登录账号，GitHub noreply 邮箱），GIT_AUTHOR_*/GIT_COMMITTER_* 环境变量注入压过一切 git config",
    repo = "https://github.com/LoserFox/dsh-git-identity",
    homepage = "https://github.com/LoserFox/dsh-git-identity",
    authors = {"LoserFox"},

    status = "dev",
    categories = {"dsh-plugin", "uncategorized"},
    keywords = {"dsh", "git", "identity"},

    dsh = {
        bundle_name = "@loserfox/git-identity",
        source = "github",
        origin = "LoserFox/dsh-git-identity",

        versions = {
            ["0.1.0"] = { ref = "39c608ca8e0779c93c66648ad457decffdf61903" },
        },
        latest = "0.1.0",

        needs_build = false,
        license = "NONE",

        -- Upstream ships no redistributable license, so this index has
        -- no right to mirror it: no `mirror` block, installs straight
        -- from git, and it cannot be recovered if upstream disappears.
    },
}
