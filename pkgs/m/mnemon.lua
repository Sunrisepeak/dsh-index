package = {
    spec = "1",

    name = "mnemon",
    description = "LLM-supervised persistent memory for AI agents — graph-based recall, cross-session knowledge, single binary. Works with DeepSeek Harness, Claude Code, OpenClaw, and any agent runtime.",
    repo = "https://github.com/mnemon-dev/mnemon",
    homepage = "https://github.com/mnemon-dev/mnemon",
    licenses = {"Apache-2.0"},
    authors = {"mnemon-dev"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@mnemon-dev/dsh-mnemon",

        versions = {
            ["0.1.0"] = { commit = "e4040e728d8019298936f0d2558e1c89aca8f9e1" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
