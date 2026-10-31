package = {
    spec = "1",

    name = "dsh-origin-plugin",
    description = "Drive OriginLab Origin scientific plotting from AI chat via MCP. 74 tools: modal-dialog watchdog, LabTalk safety gate, FigureSpec declarative YAML, fit params, matrix tools, matplotlib bridge, PPT assembly, editable OPJU delivery. Windows + Origin 2021+.",
    repo = "https://github.com/Fantasality/dsh-origin-plugin",
    homepage = "https://github.com/Fantasality/dsh-origin-plugin",
    licenses = {"MIT"},
    authors = {"Fantasality"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-origin-plugin",

        versions = {
            ["2.7.3"] = { commit = "fefeca7de2be9f499887948ecee308bbe7dd0f92" },
        },
        latest = "2.7.3",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
