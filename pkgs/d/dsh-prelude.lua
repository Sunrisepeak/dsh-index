package = {
    spec = "1",

    name = "dsh-prelude",
    description = "DeepSeek Harness (DSH) 提示词工程插件：用 90 张方法卡发现遗漏，在光标处补一句，或对照原稿采用整段改写。Prompt optimizer and editor for the DSH chat composer.",
    repo = "https://github.com/dbcaskml183-dotcom/dsh-prelude",
    homepage = "https://github.com/dbcaskml183-dotcom/dsh-prelude",
    licenses = {"MIT"},
    authors = {"dbcaskml183-dotcom"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-prompt-coach",

        versions = {
            ["0.4.25"] = { commit = "22487f9a968bc7316aa2c96d8ed6e686035b9c79" },
        },
        latest = "0.4.25",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
