package = {
    spec = "1",

    name = "dsh-novel-forge",
    description = "AI 写长篇的四个死法：设定崩、看不见前文、水文超字数、满屏 AI 味——这个插件全用代码堵死。细纲不批准就不给写章，设定改值直接拒绝，重复句段机审拦下，六维去 AI 味扫描零 token。右侧栏锻炉面板带听书、全书体检、批量起草断点续跑；20 个 novel_* 工具，你只管讲故事，把关交给代码。Novel-writing guardrails plugin for DeepSeek Harness (DSH).",
    repo = "https://github.com/huangziyuan-general/dsh-novel-forge",
    homepage = "https://github.com/huangziyuan-general/dsh-novel-forge",
    licenses = {"MIT"},
    authors = {"huangziyuan-general"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-novel-forge",

        versions = {
            ["1.3.5"] = { commit = "2031091d8f96ab09071420064af588370821e5d4" },
        },
        latest = "1.3.5",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
