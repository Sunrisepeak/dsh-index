package = {
    spec = "1",

    name = "dsh-user-experience",
    description = "Persona-driven UX walkthrough plugin for DeepSeek Harness (DSH) - scans React + TypeScript source code for UX issues, pinpoints them, and suggests fixes.",
    repo = "https://github.com/DietCokewithSugar/dsh-user-experience",
    homepage = "https://github.com/DietCokewithSugar/dsh-user-experience",
    licenses = {"MIT"},
    authors = {"DietCokewithSugar"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-user-experience",

        versions = {
            ["0.3.1"] = { commit = "c6fd7766234ae341d066f0bcf18cfd57a452ae6c" },
        },
        latest = "0.3.1",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
