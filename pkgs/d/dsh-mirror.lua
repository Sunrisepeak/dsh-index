package = {
    spec = "1",

    name = "dsh-mirror",
    description = "Let the AI know you. 让模型主动记下你的判断依据（原则/红线/工作方式），跨会话复用 —— 有容量、会遗忘、每条都说得出为什么记。",
    repo = "https://github.com/webkubor/dsh-mirror",
    homepage = "https://github.com/webkubor/dsh-mirror",
    licenses = {"MIT"},
    authors = {"webkubor"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@dsh-plugins/dsh-user-mirror",

        versions = {
            ["0.8.6"] = { commit = "f4f94a4658633e336d56da83e6a81478e4a1c91f" },
        },
        latest = "0.8.6",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
