package = {
    spec = "1",

    name = "dsh-plugin-writing-guard",
    description = "DeepSeek Harness (DSH) academic writing guard for papers — 论文去AI味 / AI-writing style detection, evidence preservation, journal-fit calibration, manuscript proofreading, writing_audit & automatic checks. Local, zero network, zero LLM.",
    repo = "https://github.com/xmutfyh/dsh-plugin-writing-guard",
    homepage = "https://github.com/xmutfyh/dsh-plugin-writing-guard",
    licenses = {"MIT"},
    authors = {"xmutfyh"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-plugin-writing-guard",

        versions = {
            ["1.6.2"] = { commit = "aa037036122d12e6bebf6e9052b16b0425f61a47" },
        },
        latest = "1.6.2",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
