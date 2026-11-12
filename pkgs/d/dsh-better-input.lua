package = {
    spec = "1",

    name = "dsh-better-input",
    description = "BetterInput是一套输入增强套件：从语音识别、AI 润色、提示词优化，到把各类文件转成结构清晰的Md，再到交互体验优化等——把每一种喂给智能体的输入都变得更好。BetterInput is an input-enhancement suite for DSH: voice recognition, AI polishing, prompt optimization, turning files into structured Markdown, and UX refinements — making every input you feed an agent better.",
    repo = "https://github.com/DIAG5/dsh-better-input",
    homepage = "https://github.com/DIAG5/dsh-better-input",
    licenses = {"MIT"},
    authors = {"DIAG5"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-better-input",

        versions = {
            ["0.1.7"] = { commit = "51d56fe682a15316e6ae7b4bfe9b668107c101ec" },
        },
        latest = "0.1.7",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
