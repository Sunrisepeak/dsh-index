package = {
    spec = "1",

    name = "dsh-evolve",
    description = "自进化插件：agent 在 session 内随对话给自己长出/剪掉能力 —— evolve_add 热挂载持久化 cordis 插件（下一 step 工具即可见），evolve_remove 可逆卸载，重启自动恢复",
    repo = "https://github.com/william-jin-cmu/dsh-evolve",
    homepage = "https://github.com/william-jin-cmu/dsh-evolve",
    authors = {"william-jin-cmu"},

    status = "dev",
    categories = {"dsh-plugin", "tools", "session"},
    keywords = {"dsh", "evolve"},

    dsh = {
        bundle_name = "@dsh-external/dsh-evolve",

        versions = {
            ["0.1.0"] = { commit = "37462647f89612ab89b18fadb88299e550748200" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- Upstream ships no redistributable license, so this index has
        -- no right to mirror it: no `mirror` block, installs straight
        -- from git, and it cannot be recovered if upstream disappears.
    },
}
