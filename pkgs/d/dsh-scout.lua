package = {
    spec = "1",

    name = "dsh-scout",
    description = "面向 DeepSeek Harness 的只读环境探测插件，为智能体提供运行环境、软件版本、系统资源、端口、服务、硬件及工作区信息。",
    repo = "https://github.com/omdsh-dev/dsh-scout",
    homepage = "https://github.com/omdsh-dev/dsh-scout",
    authors = {"omdsh-dev"},

    status = "dev",
    categories = {"dsh-plugin", "uncategorized"},
    keywords = {"dsh", "scout"},

    dsh = {
        bundle_name = "@deepseek-ai/dsh-tool-scout",

        versions = {
            ["0.0.1-rc.2"] = { commit = "3fa0c5c0e0063e517ddeea032bb8c3964b80f47f" },
        },
        latest = "0.0.1-rc.2",

        needs_build = true,

        -- Upstream ships no redistributable license, so this index has
        -- no right to mirror it: no `mirror` block, installs straight
        -- from git, and it cannot be recovered if upstream disappears.
    },
}
