package = {
    spec = "1",

    name = "dsh-russian-lang",
    description = "100% русская локализация и Smart UX для DeepSeek Harness (DSH v0.1.7+): 7574 ключа (ядро + 59 плагинов), живые оверрайды, инспектор переводов, типографика, исправление раскладки.",
    repo = "https://github.com/GooDAnDReaDY/dsh-russian-lang",
    homepage = "https://github.com/GooDAnDReaDY/dsh-russian-lang",
    licenses = {"MIT"},
    authors = {"GooDAnDReaDY"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@goodandready/dsh-russian-lang",

        versions = {
            ["0.3.18"] = { commit = "c681027b622460126940edd57ec30dd473dbd1cd" },
        },
        latest = "0.3.18",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
