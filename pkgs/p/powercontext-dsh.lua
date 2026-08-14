package = {
    spec = "1",

    name = "powercontext-dsh",
    description = "DeepSeek Harness plugin that connects to a PowerContext Server over HTTP for recall, memory, handoff, experience, and skills.",
    repo = "https://github.com/knqiufan/powercontext-dsh",
    homepage = "https://github.com/knqiufan/powercontext-dsh",
    licenses = {"Apache-2.0"},
    authors = {"knqiufan"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "powercontext-dsh",

        versions = {
            ["0.0.2"] = { commit = "85f04d0f659ffbf746cf1c2ad0b8efa8cd643bbc" },
        },
        latest = "0.0.2",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
