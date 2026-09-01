package = {
    spec = "1",

    name = "dsh-refactor-insight",
    description = "Turn codebase smells into an executable, priority-ordered refactoring plan: file-length / deep-nesting / function-length / god-object heuristics plus a staged runbook (read-only, no auto-rewrite). 重构入口诊断：把代码库坏味道转成带定位、优先级与依赖顺序的可执行重构计划。",
    repo = "https://github.com/duyanta123/dsh-refactor-insight",
    homepage = "https://github.com/duyanta123/dsh-refactor-insight",
    licenses = {"MIT"},
    authors = {"duyanta123"},

    status = "dev",
    categories = {"dsh-plugin", "code-quality", "skills"},
    keywords = {"dsh", "refactor", "code-quality", "smell"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-refactor-insight",

        versions = {
            ["0.1.0"] = { commit = "141f7a50e215766b9efe18e0287507a47cfcecbc" },
            ["0.1.1"] = { commit = "d5f1e5a835c627d39244c66577bdf83b3c0c9670" },
        },
        latest = "0.1.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
