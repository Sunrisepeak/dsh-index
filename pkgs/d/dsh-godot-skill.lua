package = {
    spec = "1",

    name = "dsh-godot-skill",
    description = "Godot Engine 4.x 全栈游戏开发技能插件 for DeepSeek Harness (DSH) — registers the godot-4-development skill at runtime",
    repo = "https://github.com/akira399/dsh-godot-skill",
    homepage = "https://github.com/akira399/dsh-godot-skill",
    licenses = {"MIT"},
    authors = {"akira399"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-godot-skill",

        versions = {
            ["1.0.0"] = { commit = "393cec166392d2d8aeee2452ef6b82a622e5202a" },
        },
        latest = "1.0.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
