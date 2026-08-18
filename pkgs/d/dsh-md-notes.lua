package = {
    spec = "1",

    name = "dsh-md-notes",
    description = "A note-taking plugin for DeepSeek Harness (DSH). It provides a full MD notes manager and MD notes editor, letting you quickly capture conversation content into notes. Notes can be maintained by syncing to a Git repository",
    repo = "https://github.com/XieZongChen/dsh-md-notes",
    homepage = "https://github.com/XieZongChen/dsh-md-notes",
    licenses = {"MIT"},
    authors = {"XieZongChen"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-md-notes",

        versions = {
            ["0.4.0"] = { commit = "17eccd1324111f490bd5139fe46adee1c0db5b39" },
        },
        latest = "0.4.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
