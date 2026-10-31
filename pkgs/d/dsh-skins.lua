package = {
    spec = "1",

    name = "dsh-skins",
    description = "Skin center plugin and built-in skins for the DSH Web GUI: skins are pure asset directories, loaded and rendered by the skin center, and installed on demand from dsh-market.com.",
    repo = "https://github.com/zhu1090093659/dsh-skins",
    homepage = "https://github.com/zhu1090093659/dsh-skins",
    licenses = {"BSD-3-Clause"},
    authors = {"zhu1090093659"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@linxin666/dsh-client-ui-skin-center",

        versions = {
            ["0.4.13"] = { commit = "1697af9820c236c4154c6ce986261cdce0b7afe0" },
        },
        latest = "0.4.13",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
