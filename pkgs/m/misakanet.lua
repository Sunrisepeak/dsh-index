package = {
    spec = "1",

    name = "misakanet",
    description = "📚 A zero-dependency, git-backed micro-lesson library for AI Agents to asynchronously share and search verified debugging experience. Python stdlib only. | https://misakanet.org",
    repo = "https://github.com/Ikalus1988/MisakaNet",
    homepage = "https://github.com/Ikalus1988/MisakaNet",
    licenses = {"Apache-2.0"},
    authors = {"Ikalus1988"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "misakanet",

        versions = {
            ["0.0.0"] = { commit = "752a746f7336b7dfc8b7e4c68e22ad7cb2c45c16" },
        },
        latest = "0.0.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
