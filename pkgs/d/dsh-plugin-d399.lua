package = {
    spec = "1",

    name = "dsh-plugin-d399",
    description = "深夜寂寞？来玩 D399 — 当模型生成时弹出小游戏菜单（wordle / 消消乐，可拓展游戏注册表）",
    repo = "https://github.com/HuanLinOTO/dsh-plugin-d399",
    homepage = "https://github.com/HuanLinOTO/dsh-plugin-d399",
    authors = {"HuanLinOTO"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh", "plugin"},

    dsh = {
        bundle_name = "@huanlin/dsh-plugin-d399",
        source = "github",
        origin = "HuanLinOTO/dsh-plugin-d399",

        versions = {
            ["0.1.0"] = { ref = "038b9057f84d15d987729da2e1595ab313031388" },
        },
        latest = "0.1.0",

        needs_build = false,
        license = "NOASSERTION",

        -- Upstream ships no redistributable license, so this index has
        -- no right to mirror it: no `mirror` block, installs straight
        -- from git, and it cannot be recovered if upstream disappears.
    },
}
