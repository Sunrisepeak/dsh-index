package = {
    spec = "1",

    name = "dsh-mermaid",
    description = "在 DSH Web 会话中把 Mermaid 代码围栏渲染为 SVG 图表 | Render Mermaid code fences as SVG diagrams in DSH Web messages",
    repo = "https://github.com/AKS1st/dsh-mermaid",
    homepage = "https://github.com/AKS1st/dsh-mermaid",
    licenses = {"MIT"},
    authors = {"AKS1st"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-mermaid",

        versions = {
            ["0.5.0"] = { commit = "2708cdf2e2eb1c0cd15448c3d3d680b8fba58d48" },
        },
        latest = "0.5.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
