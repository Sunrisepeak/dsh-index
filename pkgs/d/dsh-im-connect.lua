package = {
    spec = "1",

    name = "dsh-im-connect",
    description = "DSH IM Connect — 将主流即时通讯平台接入本机 DeepSeek Harness · Connect major messaging platforms to local DeepSeek Harness agents",
    repo = "https://github.com/MichengAI/dsh-im-connect",
    homepage = "https://github.com/MichengAI/dsh-im-connect",
    licenses = {"Apache-2.0"},
    authors = {"MichengAI"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@michengai/dsh-im-connect",

        versions = {
            ["0.1.34"] = { commit = "8d5309e968ec93a68dc0c3e9c973ad8832517e44" },
        },
        latest = "0.1.34",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
