package = {
    spec = "1",

    name = "dsh-ui-spec",
    description = "DeepSeek Harness plugin: turn UI screenshots into structured, implementation-grade web frontend specs. Deterministic geometry (sharp) + optional vision-model semantics, merged into one JSON + Markdown spec.",
    repo = "https://github.com/yumimanji/dsh-ui-spec",
    homepage = "https://github.com/yumimanji/dsh-ui-spec",
    licenses = {"MIT"},
    authors = {"yumimanji"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-ui-spec",

        versions = {
            ["0.1.0"] = { commit = "0b60f83d4ad2176fa88ddeaa086f118e8c64412f" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
