package = {
    spec = "1",

    name = "dsh-conversation-share",
    description = "分享任意段落的 DSH 对话",
    repo = "https://github.com/bill9109/dsh-conversation-share",
    homepage = "https://github.com/bill9109/dsh-conversation-share",
    licenses = {"BSD-3-Clause"},
    authors = {"bill9109"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh", "plugin"},

    dsh = {
        bundle_name = "@dsh-external/dsh-conversation-share",
        source = "github",
        origin = "bill9109/dsh-conversation-share",

        versions = {
            ["0.1.0"] = { ref = "495114aa0114aed86b5fa6632f8be9dc2762039a" },
        },
        latest = "0.1.0",

        needs_build = false,
        license = "BSD-3-Clause",

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
