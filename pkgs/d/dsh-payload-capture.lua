package = {
    spec = "1",

    name = "dsh-payload-capture",
    description = "DSH 插件：捕捉每次上行模型 API payload，JSON 落盘",
    repo = "https://github.com/Moeblack/dsh-payload-capture",
    homepage = "https://github.com/Moeblack/dsh-payload-capture",
    authors = {"Moeblack"},

    status = "dev",
    categories = {"dsh-plugin", "provider"},
    keywords = {"dsh", "payload", "capture"},

    dsh = {
        bundle_name = "dsh-payload-capture",

        versions = {
            ["0.1.0"] = { commit = "75cd434c6b854323f0f6bdb75ea8694480082d03" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- Upstream ships no redistributable license, so this index has
        -- no right to mirror it: no `mirror` block, installs straight
        -- from git, and it cannot be recovered if upstream disappears.
    },
}
