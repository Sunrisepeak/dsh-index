package = {
    spec = "1",

    name = "dsh-benchmark",
    description = "Deterministic revision-pinned benchmarks and regression evidence for DeepSeek Harness",
    repo = "https://github.com/dongsheng123132/dsh-benchmark",
    homepage = "https://github.com/dongsheng123132/dsh-benchmark",
    licenses = {"MIT"},
    authors = {"dongsheng123132"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "benchmark",

        bundle_name = "dsh-benchmark",

        versions = {
            ["0.1.0"] = { commit = "2d314167f254053f9d9385937540df7c31a9d85b" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
