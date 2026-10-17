package = {
    spec = "1",

    name = "dsh-host-rsi",
    description = "DSH host RSI for local LLMs (currently Qwen3.8 27B): per-use continual self-improvement, counter-reason self-check, critic escalation, and memory retrieval.简单来说根据论文建立的长期反思教训机制，让大模型不再犯错，越用越强！重点是千问3.8 27B/FLASH这种本地LLM模型！当然在线大模型理论上也可以通用！",
    repo = "https://github.com/pk14742952-AD/dsh-host-rsi",
    homepage = "https://github.com/pk14742952-AD/dsh-host-rsi",
    licenses = {"MIT"},
    authors = {"pk14742952-AD"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-host-rsi",

        versions = {
            ["0.2.6"] = { commit = "8a097f0aa07426749eb93cbf4440463189aee55f" },
        },
        latest = "0.2.6",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
