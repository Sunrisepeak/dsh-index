package = {
    spec = "1",

    name = "dsh-ssh-remote",
    description = "SSH remote workspaces for DeepSeek Harness: browse/read/write remote files, run remote commands, with connection status dots.",
    repo = "https://github.com/CrazyShout/dsh-ssh-remote",
    homepage = "https://github.com/CrazyShout/dsh-ssh-remote",
    licenses = {"MIT"},
    authors = {"CrazyShout"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-ssh-remote",

        versions = {
            ["0.1.0"] = { commit = "72a2ac6b0f277ab0706ee93634dee2c639070728" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
