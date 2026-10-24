package = {
    spec = "1",

    name = "dsh-filesnap",
    description = "dsh-filesnap — 把对话和它改过的文件一起回退到某一轮之前,不需要 git 仓库. A blazing-fast rewind and redo plugin for DeepSeek Harness, powered by a 🦀 Rust core, tracking the conversion and the files it changed, no git required, low disk consumption",
    repo = "https://github.com/extracurricular-ai/dsh-filesnap",
    homepage = "https://github.com/extracurricular-ai/dsh-filesnap",
    licenses = {"Apache-2.0"},
    authors = {"extracurricular-ai"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-filesnap",

        versions = {
            ["0.2.2"] = { commit = "62d5a8cd1d3bbd095368804da4bfdeabe1c22922" },
        },
        latest = "0.2.2",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
