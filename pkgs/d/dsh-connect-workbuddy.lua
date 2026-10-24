package = {
    spec = "1",

    name = "dsh-connect-workbuddy",
    description = "Connect locally signed-in WorkBuddy models to DeepSeek Harness with a read-only credits overview and model management.",
    repo = "https://github.com/dingminhua/dsh-connect-workbuddy",
    homepage = "https://github.com/dingminhua/dsh-connect-workbuddy",
    licenses = {"MIT"},
    authors = {"dingminhua"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "desktop",

        bundle_name = "dsh-connect-workbuddy",

        versions = {
            ["1.4.0"] = { commit = "e78a14351020c04c92651480c69a248a4bce6996" },
        },
        latest = "1.4.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
