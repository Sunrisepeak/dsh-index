package = {
    spec = "1",

    name = "dsh-unlag",
    description = "Clear a sluggish DeepSeek Harness workbench without restarting: rebuild the interface and swap plugin code in place, keeping running turns, queued messages and unsent drafts.",
    repo = "https://github.com/regrevia/dsh-unlag",
    homepage = "https://github.com/regrevia/dsh-unlag",
    licenses = {"MIT"},
    authors = {"regrevia"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-unlag",

        versions = {
            ["1.15.0"] = { commit = "b4ae147edcd9d3025bb67a6bc4b99334ba1fac05" },
        },
        latest = "1.15.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
