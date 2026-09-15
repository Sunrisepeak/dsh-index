package = {
    spec = "1",

    name = "dsh-nested-followups",
    description = "Ask a follow-up on any past answer in an isolated branch, keeping your main conversation clean. 针对任意历史回答发起追问，新问题在独立分支中展开，主对话保持干净。A conversation-tree plugin for DeepSeek Harness / DeepSeek Harness 会话树插件。",
    repo = "https://github.com/sluminositys/dsh-nested-followups",
    homepage = "https://github.com/sluminositys/dsh-nested-followups",
    licenses = {"MIT"},
    authors = {"sluminositys"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-nested-followups",

        versions = {
            ["0.2.1"] = { commit = "8d1ceea56253b2fbd146014a7423a8676fbeb3e8" },
        },
        latest = "0.2.1",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
