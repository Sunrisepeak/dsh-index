package = {
    spec = "1",

    name = "dsh-file-upload",
    description = "DeepSeek Harness (dsh) file-message plugin: Claude-style drag-and-drop / paperclip upload, content sniffing, document-to-Markdown via Microsoft MarkItDown (with built-in JS fallback), text inlining, read_document tool for agents.",
    repo = "https://github.com/HongMing-Huang/dsh-file-upload",
    homepage = "https://github.com/HongMing-Huang/dsh-file-upload",
    licenses = {"MIT"},
    authors = {"HongMing-Huang"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-file-upload",

        versions = {
            ["0.4.3"] = { commit = "79759cb31c9971706cb9a5fc71d30053f1b498c3" },
        },
        latest = "0.4.3",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
