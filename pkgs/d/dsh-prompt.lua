package = {
    spec = "1",

    name = "dsh-prompt",
    description = "DeepSeek Harness 的 Prompt 工具箱：别再复制粘贴——24 条深度模板随手点，/prompt 与智能推荐主动兜底，装好即用、可自定义。 | The Prompt toolbox for DeepSeek Harness: stop copy-pasting — 24 deep templates at a click, /prompt & smart suggestions as backup; out of the box, fully customizable.",
    repo = "https://github.com/FeatherHunter/dsh-prompt",
    homepage = "https://github.com/FeatherHunter/dsh-prompt",
    licenses = {"MIT"},
    authors = {"FeatherHunter"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-prompt",

        versions = {
            ["0.3.0"] = { commit = "2a71b826f54ae964d949d6295dc9dedd8d12281c" },
        },
        latest = "0.3.0",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
