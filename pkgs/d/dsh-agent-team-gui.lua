package = {
    spec = "1",

    name = "dsh-agent-team-gui",
    description = "Persistent multi-model agent squads for DeepSeek Harness — reusable teams, per-agent model/tool policies, and ordinary-chat collaboration.",
    repo = "https://github.com/toolclub/dsh-agent-team-gui",
    homepage = "https://github.com/toolclub/dsh-agent-team-gui",
    licenses = {"MIT"},
    authors = {"toolclub"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-agent-team-gui",

        versions = {
            ["0.4.0"] = { commit = "ab85daadd31c32b4bab9eb3fc86ebc8ae50dee30" },
        },
        latest = "0.4.0",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
