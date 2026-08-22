package = {
    spec = "1",

    name = "dsh-timeline",
    description = "为 DeepSeek Harness（DSH）打造的会话效率插件，时间轴导航、收藏文件夹、对话导出、提示词库、闪记。",
    repo = "https://github.com/houyanchao/dsh-timeline",
    homepage = "https://github.com/houyanchao/dsh-timeline",
    authors = {"houyanchao"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-timeline",

        versions = {
            ["0.1.3"] = { commit = "599dfb47934a2afb00c29e00d303acfb966ad2cd" },
        },
        latest = "0.1.3",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
