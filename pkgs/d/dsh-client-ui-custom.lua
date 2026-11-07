package = {
    spec = "1",

    name = "dsh-client-ui-custom",
    description = "Configurable DSH web-surface plugin: wallpaper & frosted-glass themes, accent colors, custom keyboard shortcuts, app-usage panel, history strip, message Markdown — zero shell edits.",
    repo = "https://github.com/yoli-mi/dsh-client-ui-custom",
    homepage = "https://github.com/yoli-mi/dsh-client-ui-custom",
    licenses = {"MIT"},
    authors = {"yoli-mi"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@ha-na-bi/dsh-client-ui-custom",

        versions = {
            ["0.1.0-rc.6"] = { commit = "61e2aed78b2880d3a8640808b83f3f42082067df" },
        },
        latest = "0.1.0-rc.6",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
