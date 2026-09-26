package = {
    spec = "1",

    name = "dsh-yolo",
    description = "把对话里说过的重要事情，变成持续可跟进的计划。  为 deepseek-harness 打造的个人助手：从对话中整理事项、跟踪变化，并在需要时提醒你。",
    repo = "https://github.com/hanshanyike/dsh-yolo",
    homepage = "https://github.com/hanshanyike/dsh-yolo",
    licenses = {"MIT"},
    authors = {"hanshanyike"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-plugin-yolo",

        versions = {
            ["0.4.0-rc5"] = { commit = "74eeab97af63744675156078e36205131f5d4b23" },
        },
        latest = "0.4.0-rc5",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
