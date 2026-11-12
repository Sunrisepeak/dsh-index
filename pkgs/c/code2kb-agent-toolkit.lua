package = {
    spec = "1",

    name = "code2kb-agent-toolkit",
    description = "面向 AI 编码助手的源码知识生产工具包：提取业务规则，生成可追溯的机器人问答知识 | An agent toolkit for evidence-backed knowledge from source code.",
    repo = "https://github.com/Ethereal-Space-one/code2kb-agent-toolkit",
    homepage = "https://github.com/Ethereal-Space-one/code2kb-agent-toolkit",
    licenses = {"Apache-2.0"},
    authors = {"Ethereal-Space-one"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "desktop",

        bundle_name = "code2kb-dsh",

        versions = {
            ["2.2.0"] = { commit = "8ebfe4d55744092d1c7608c24d6ca1482d49e6ef" },
        },
        latest = "2.2.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
