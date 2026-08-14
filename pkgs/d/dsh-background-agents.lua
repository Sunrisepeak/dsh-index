package = {
    spec = "1",

    name = "dsh-background-agents",
    description = "Interactive long-session background agents for DeepSeek Harness: start a durable continuable child agent, watch its progress in the Web UI sidebar, message it any time, and interrupt it - all through the official subagent seam.",
    repo = "https://github.com/PerryLink/dsh-background-agents",
    homepage = "https://github.com/PerryLink/dsh-background-agents",
    licenses = {"Apache-2.0"},
    authors = {"PerryLink"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "headless",

        bundle_name = "dsh-background-agents",

        versions = {
            ["0.4.0"] = { commit = "54ec7fc06b27347cdc42c5ea987d37d9692b8dc9" },
        },
        latest = "0.4.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
