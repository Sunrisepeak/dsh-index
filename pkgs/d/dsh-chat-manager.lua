package = {
    spec = "1",

    name = "dsh-chat-manager",
    description = "DeepSeek Harness chat history and session management: search archives, restore conversations, and delete safely.",
    repo = "https://github.com/WSL043/dsh-chat-manager",
    homepage = "https://github.com/WSL043/dsh-chat-manager",
    licenses = {"MIT"},
    authors = {"WSL043"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-chat-manager",

        versions = {
            ["1.5.16"] = { commit = "38d1b575b1fee83d0b1844d38919445a784ad106" },
        },
        latest = "1.5.16",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
