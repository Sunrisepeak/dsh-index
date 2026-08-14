package = {
    spec = "1",

    name = "dsh-hotreload-plugin-manager",
    description = "DeepSeek Harness plugin: hot install / uninstall / update / enable-disable of profile plugin bundles from the running dsh web — no restart, Web UI included.",
    repo = "https://github.com/kyorakuyk/dsh-hotreload-plugin-manager",
    homepage = "https://github.com/kyorakuyk/dsh-hotreload-plugin-manager",
    licenses = {"MIT"},
    authors = {"kyorakuyk"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@kyorakuyk/dsh-plugin-manager",

        versions = {
            ["0.1.4"] = { commit = "5bc55025d1fc2fe2d8e432f924185f427a400fd5" },
        },
        latest = "0.1.4",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
