package = {
    spec = "1",

    name = "dsh-plugin-workshop",
    description = "Steam Workshop-style plugin browser for the DeepSeek Harness (DSH) Web UI - zero-server: GitHub-powered search, trending windows, Chinese search & bilingual translation, plugin-signature filtering, and smart one-click install/update/uninstall with an installed-plugins manager.",
    repo = "https://github.com/yyyyukari/dsh-plugin-workshop",
    homepage = "https://github.com/yyyyukari/dsh-plugin-workshop",
    licenses = {"MIT"},
    authors = {"yyyyukari"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@dsh-external/dsh-plugin-workshop",

        versions = {
            ["1.6.1"] = { commit = "acc2d75eaa976afab8e1e4ea2176bc9b51b139fa" },
            ["1.5.1"] = { commit = "afb56fd1defbcd76ec1c70cd838fdb446937e5ab" },
        },
        latest = "1.6.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
