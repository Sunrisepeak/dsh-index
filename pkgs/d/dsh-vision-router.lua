package = {
    spec = "1",

    name = "dsh-vision-router",
    description = "Eyes for text-only DeepSeek Harness agents: built-in free vision chain (no key) + pixel-level vision tools (Q&A, grounding, crop, pixel diff, colors, OCR, SVG trace, cutout, screenshots). One-command install, no Python, image turns work like ordinary tool-calling turns.",
    repo = "https://github.com/ysr666/dsh-vision-router",
    homepage = "https://github.com/ysr666/dsh-vision-router",
    licenses = {"MIT"},
    authors = {"ysr666"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-vision-router",

        versions = {
            ["1.5.3"] = { commit = "34d850cb554c813fbaf41e2f3842ecae80bb2dbb" },
            ["1.4.4"] = { commit = "331b3bbaa65e80ed98a6c0543e18d7f8ce280f03" },
            ["1.2.3"] = { commit = "ddfa6baf3f70ff9ddb2b5e7ff3a09d5840398d1f" },
            ["1.1.0"] = { commit = "bc815bd078e824e32090a9e8c7503c83e440ad08" },
        },
        latest = "1.5.3",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
