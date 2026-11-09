package = {
    spec = "1",

    name = "skill-wb-exec",
    description = "Delegate bounded coding tasks to a headless WorkBuddy/CodeBuddy CLI agent from DeepSeek Harness — structured result, real diff, path whitelist and worktree isolation.",
    repo = "https://github.com/Luminousyyh/skill-wb-exec",
    homepage = "https://github.com/Luminousyyh/skill-wb-exec",
    licenses = {"MIT"},
    authors = {"Luminousyyh"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "wb-exec-dsh",

        versions = {
            ["1.4.0"] = { commit = "f02c7f259bab490722dc2f2adc41481500cfd61d" },
        },
        latest = "1.4.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
