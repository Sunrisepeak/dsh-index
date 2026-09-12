package = {
    spec = "1",

    name = "dsh-lsp-actions",
    description = "LSP action surface for DeepSeek Harness: diagnostics, formatting, completion, code actions, symbols, signature help, inlay hints, and rename tools over language servers",
    repo = "https://github.com/PerryLink/dsh-lsp-actions",
    homepage = "https://github.com/PerryLink/dsh-lsp-actions",
    licenses = {"Apache-2.0"},
    authors = {"PerryLink"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-lsp-actions",

        versions = {
            ["0.4.1"] = { commit = "896650edd928dddb4e4362216e1cac2562aec95e" },
        },
        latest = "0.4.1",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
