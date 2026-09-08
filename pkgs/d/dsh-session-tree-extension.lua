package = {
    spec = "1",

    name = "dsh-session-tree-extension",
    description = "dsh-session-tree-extension Append-only, multi-branch conversation trees for DeepSeek-Harness — a PI-Agent-style SessionTree. The agent's history becomes a tree of immutable nodes, forkable at any historical node, with standard LLM message reconstruction, versioned JSON snapshots, and a WebUI tree panel embedded in the existing chat composer (no sta",
    repo = "https://github.com/robiteame/dsh-session-tree-extension",
    homepage = "https://github.com/robiteame/dsh-session-tree-extension",
    licenses = {"MIT"},
    authors = {"robiteame"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-session-tree-extension",

        versions = {
            ["0.1.0"] = { commit = "41a8fe06097c51901c876b362f28d968fc543c06" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
