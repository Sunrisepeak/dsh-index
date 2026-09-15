package = {
    spec = "1",

    name = "dsh-workbuddy-connect",
    description = "将 WorkBuddy 桌面 App 包含的模型自动接入 DeepSeek Harness，零配置使用。Bring the models in the WorkBuddy desktop app into DeepSeek Harness with zero configuration.",
    repo = "https://github.com/corrinehu/dsh-workbuddy-connect",
    homepage = "https://github.com/corrinehu/dsh-workbuddy-connect",
    licenses = {"MIT"},
    authors = {"corrinehu"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-workbuddy-connect",

        versions = {
            ["0.2.2"] = { commit = "f077358ba59bca51e0f45efb37465a433cc47b16" },
        },
        latest = "0.2.2",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
