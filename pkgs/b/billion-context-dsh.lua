package = {
    spec = "1",

    name = "billion-context-dsh",
    description = "Model-driven context management (Active Context Pruning / ACP) for the DeepSeek Harness — the model decides when and what to compress. Ported from billion-context-pi (ranxianglei); acp-kernel reused verbatim. CompactionEngine backend with compress/decompress/search_context/acp_status tools.",
    repo = "https://github.com/Tyan66666/billion-context-dsh",
    homepage = "https://github.com/Tyan66666/billion-context-dsh",
    licenses = {"MIT"},
    authors = {"Tyan66666"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "billion-context-dsh",

        versions = {
            ["0.2.1"] = { commit = "7a2ca468689368483ef4c1deb37e23526bd5534b" },
        },
        latest = "0.2.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
