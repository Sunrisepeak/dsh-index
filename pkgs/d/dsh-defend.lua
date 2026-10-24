package = {
    spec = "1",

    name = "dsh-defend",
    description = "Prompt-injection, jailbreak, and secret-leak defense for DeepSeek Harness: Aho-Corasick detection with allow/ask/block interception and sanitized audit events",
    repo = "https://github.com/PerryLink/dsh-defend",
    homepage = "https://github.com/PerryLink/dsh-defend",
    licenses = {"Apache-2.0"},
    authors = {"PerryLink"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-defend",

        versions = {
            ["0.3.11"] = { commit = "6f0d186ac44195703c9462a4c988769ae31cf337" },
        },
        latest = "0.3.11",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
