package = {
    spec = "1",

    name = "dsh-memory-evolve",
    description = "为 DeepSeek Harness 带来「跨会话长期记忆 + 后台自我进化」能力的纯插件实现：五轨记忆 · git 分支感知 · 回合内自我审查 · 技能自我进化与技能管理器 · 四轨待办 · COI 调度 · 会话广播 · 会话搜索 · 提示词管理器 · 临时信息便签——零核心修改、零运行时依赖，随装随用、卸载即净。",
    repo = "https://github.com/csyangwen/dsh-memory-evolve",
    homepage = "https://github.com/csyangwen/dsh-memory-evolve",
    licenses = {"MIT"},
    authors = {"csyangwen"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-memory-evolve",

        versions = {
            ["0.1.0"] = { commit = "1aca4c49f23116e05f9ee645265bcdcf7e50d9a0" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
