package = {
    spec = "1",

    name = "dsh-reasoning-effort",
    description = "DSH适用的Codex风格的思考强度滑块，以及大肥鱼跑步滑块。Codex-style model and reasoning-effort slider for DeepSeek Harness",
    repo = "https://github.com/HanaAyane/dsh-reasoning-effort",
    homepage = "https://github.com/HanaAyane/dsh-reasoning-effort",
    licenses = {"MIT"},
    authors = {"HanaAyane"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-reasoning-effort",

        versions = {
            ["0.4.0"] = { commit = "a837e101a59648f0013ff463a407fe61953f1e0f" },
        },
        latest = "0.4.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
