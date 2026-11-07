package = {
    spec = "1",

    name = "dsh-wish-specializer",
    description = "许愿特化器 · Wish Specializer — DSH 插件：让模型更出色地，不误解你的意思地，完成你的“愿望”。在短提示词+自带的Wish预设（PTC也可以）+重度的情况下，可以起到巨大的表现增益",
    repo = "https://github.com/WestFox-AwA/dsh-wish-specializer",
    homepage = "https://github.com/WestFox-AwA/dsh-wish-specializer",
    licenses = {"BSD-3-Clause"},
    authors = {"WestFox-AwA"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "po061",

        bundle_name = "@dsh-external/dsh-arbiter-wf",

        versions = {
            ["0.8.4-stable"] = { commit = "24b820cf1af6813393b36ecfe07611f5a1e51e08" },
        },
        latest = "0.8.4-stable",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
