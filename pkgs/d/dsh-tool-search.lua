package = {
    spec = "1",

    name = "dsh-tool-search",
    description = "Per-agent on-demand tool discovery and progressive schema disclosure for DeepSeek Harness",
    repo = "https://github.com/vibeinging/dsh-tool-search",
    homepage = "https://github.com/vibeinging/dsh-tool-search",
    licenses = {"MIT"},
    authors = {"vibeinging"},

    status = "dev",
    categories = {"dsh-plugin", "tools"},
    keywords = {"dsh", "tool", "search"},

    dsh = {
        bundle_name = "@deepseek-ai/dsh-tool-search",

        versions = {
            ["0.0.1"] = { commit = "265ce76eda21b211dc4a4c8f30d73a6826f035ca" },
        },
        latest = "0.0.1",

        needs_build = false,

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
