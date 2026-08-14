package = {
    spec = "1",

    name = "dsh-task-notify",
    description = "DeepSeek Harness task-completion reminder plugin",
    repo = "https://github.com/ltao0829/dsh-task-notify",
    homepage = "https://github.com/ltao0829/dsh-task-notify",
    licenses = {"BSD-3-Clause"},
    authors = {"ltao0829"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@linxin666/dsh-task-notify",

        versions = {
            ["0.1.0"] = { commit = "c4453430d6f1858f0deef6b9345e13a7f4fac847" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
