package = {
    spec = "1",

    name = "dsh-meta-orchestrator",
    description = "A model-native meta-agent plugin for DeepSeek Harness that uses the underlying model’s reasoning and planning capabilities to synthesize task-specific workflows at runtime and coordinate tools and subagents.",
    repo = "https://github.com/jiruidai/dsh-meta-orchestrator",
    homepage = "https://github.com/jiruidai/dsh-meta-orchestrator",
    licenses = {"MIT"},
    authors = {"jiruidai"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-meta-orchestrator",

        versions = {
            ["0.2.0"] = { commit = "76747663682a8a77346901a7d6af0e24800a41bd" },
        },
        latest = "0.2.0",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
