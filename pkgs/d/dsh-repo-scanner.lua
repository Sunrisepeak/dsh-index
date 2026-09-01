package = {
    spec = "1",

    name = "dsh-repo-scanner",
    description = "Read-only repository fact scanner kernel for DeepSeek Harness analysis plugins: deterministic probe / file index / modules / dependencies / entry points / symbols / graphs and git facts over a stable JSON schema (CLI + library + skill runbook). 只读仓库事实扫描内核：为分析型插件提供可复现的代码库硬事实。",
    repo = "https://github.com/duyanta123/dsh-repo-scanner",
    homepage = "https://github.com/duyanta123/dsh-repo-scanner",
    licenses = {"MIT"},
    authors = {"duyanta123"},

    status = "dev",
    categories = {"dsh-plugin", "static-analysis", "skills"},
    keywords = {"dsh", "static-analysis", "readonly", "code-analysis"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-repo-scanner",

        versions = {
            ["0.1.0"] = { commit = "a981ed623f416a3361ceb6b9ecaea75fda17a11e" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
