package = {
    spec = "1",

    name = "dsh-prompt-enhance",
    description = "Prompt enhancement plugin for the DeepSeek Harness web GUI: one-click rewrite of the composer draft into a structured prompt, with preview, fill-back, and undo.",
    repo = "https://github.com/rongxingda/dsh-prompt-enhance",
    homepage = "https://github.com/rongxingda/dsh-prompt-enhance",
    licenses = {"Apache-2.0"},
    authors = {"rongxingda"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-prompt-enhance",

        versions = {
            ["0.3.2"] = { commit = "989770f59d421e0bceff43a69c168689d3d36e6d" },
        },
        latest = "0.3.2",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
