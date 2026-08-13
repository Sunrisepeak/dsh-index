package = {
    spec = "1",

    name = "ui-status-label",
    description = "把你鲸鱼娘思考时的 deep diving 自定义成任意你想要的样子",
    repo = "https://github.com/alingalingling/ui-status-label",
    homepage = "https://github.com/alingalingling/ui-status-label",
    authors = {"alingalingling"},

    status = "dev",
    categories = {"dsh-plugin", "web-ui"},
    keywords = {"dsh", "status", "label"},

    dsh = {
        bundle_name = "dsh-ui-status-label",
        source = "github",
        origin = "alingalingling/ui-status-label",

        versions = {
            ["0.1.0"] = { ref = "1fb9c7bec678803fe5ee034644248dc2b4e4f5d9" },
        },
        latest = "0.1.0",

        needs_build = true,
        license = "NONE",

        -- Upstream ships no redistributable license, so this index has
        -- no right to mirror it: no `mirror` block, installs straight
        -- from git, and it cannot be recovered if upstream disappears.
    },
}
