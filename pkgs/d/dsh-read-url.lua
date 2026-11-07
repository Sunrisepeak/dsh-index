package = {
    spec = "1",

    name = "dsh-read-url",
    description = "DeepSeek Harness URL reader: fetch any page and return clean main-content text/Markdown. Auto charset (GBK/GB2312/UTF-8/Big5), token-efficient (6000-char cap, cache, offset), zero deps, no API key. 网页一键读全文 → 干净正文 / 结构化 Markdown",
    repo = "https://github.com/2672243194/dsh-read-url",
    homepage = "https://github.com/2672243194/dsh-read-url",
    licenses = {"MIT"},
    authors = {"2672243194"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-read-url",

        versions = {
            ["0.4.5"] = { commit = "8d9756dedc2d9ef6f7205063a558baae4a359645" },
        },
        latest = "0.4.5",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
