package = {
    spec = "1",

    name = "dsh-better-reasoning-effort",
    description = "Reasoning-effort editing for third-party models in DeepSeek Harness: per-model thinking levels with a knowledge base + protocol inference, edited inside the official Models page card.",
    repo = "https://github.com/HaoyueQin/dsh-better-reasoning-effort",
    homepage = "https://github.com/HaoyueQin/dsh-better-reasoning-effort",
    licenses = {"MIT"},
    authors = {"HaoyueQin"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-better-reasoning-effort",

        versions = {
            ["0.3.3"] = { commit = "6ae8ce2cdbe5fae5891b2284b66288f9a8928a32" },
        },
        latest = "0.3.3",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
