package = {
    spec = "1",

    name = "tizhuang-agent-skills",
    description = "2000万+中小学K12真题题库 Skill：免费注册、免费抽题、教材/章节/知识点检索、练习测验与AI智能组卷。",
    repo = "https://github.com/weishao2/tizhuang-agent-skills",
    homepage = "https://github.com/weishao2/tizhuang-agent-skills",
    licenses = {"MIT"},
    authors = {"weishao2"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "default",

        bundle_name = "dsh-tizhuang-question-bank",

        versions = {
            ["1.0.2"] = { commit = "9c443f1e4790a5cb3b830db926a4303e25bf06c6" },
        },
        latest = "1.0.2",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
