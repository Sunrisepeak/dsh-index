package = {
    spec = "1",

    name = "deepseek-balance-whale-widget-bowl",
    description = "DeepSeek Harness（DSH）Web 界面右下角的常驻余额挂件。基于 MeteorNOX/DeepSeek-Balance-Whale-Widget 修改的铁盆鲸鱼娘版。",
    repo = "https://github.com/Witherwithwinter/DeepSeek-Balance-Whale-Widget-Bowl",
    homepage = "https://github.com/Witherwithwinter/DeepSeek-Balance-Whale-Widget-Bowl",
    licenses = {"MIT"},
    authors = {"Witherwithwinter"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-whale-widget-bowl",

        versions = {
            ["0.4.0"] = { commit = "24feb651d7991cbefc46666422883635f06f333e" },
        },
        latest = "0.4.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
