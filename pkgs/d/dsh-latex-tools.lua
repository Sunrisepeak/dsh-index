package = {
    spec = "1",

    name = "dsh-latex-tools",
    description = "♾️ Copy and export the LaTeX in DeepSeek Harness 悬停任意 LaTeX 公式即可复制 TeX 源码或导出为独立的 SVG 文件",
    repo = "https://github.com/liuup/dsh-latex-tools",
    homepage = "https://github.com/liuup/dsh-latex-tools",
    licenses = {"MIT"},
    authors = {"liuup"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-latex-tools",

        versions = {
            ["0.1.2"] = { commit = "3118a51f7fc71e3bba93c472d32165cd8b89003b" },
        },
        latest = "0.1.2",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
