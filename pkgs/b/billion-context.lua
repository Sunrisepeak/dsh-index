package = {
    spec = "1",

    name = "billion-context",
    description = "基本稳定可用 100K tokens is enough. Universal context-compression proxy for ALL AI coding agents,10w上下文足矣",
    repo = "https://github.com/ranxianglei/billion-context",
    homepage = "https://github.com/ranxianglei/billion-context",
    licenses = {"MIT"},
    authors = {"ranxianglei"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "billion-context",

        versions = {
            ["0.1.129"] = { commit = "fca10cbef9702cdb2a6a9264c5a1c7b6463234a4" },
        },
        latest = "0.1.129",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
