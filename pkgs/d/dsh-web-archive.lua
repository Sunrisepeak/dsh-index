package = {
    spec = "1",

    name = "dsh-web-archive",
    description = "折叠对话当中众多的“无用消息”，例如Think、Bash等",
    repo = "https://github.com/renat3u/dsh-web-archive",
    homepage = "https://github.com/renat3u/dsh-web-archive",
    authors = {"renat3u"},

    status = "dev",
    categories = {"dsh-plugin", "web-ui", "session"},
    keywords = {"dsh", "web", "archive"},

    dsh = {
        bundle_name = "dsh-web-archive",
        source = "github",
        origin = "renat3u/dsh-web-archive",

        versions = {
            ["0.1.1"] = { ref = "e106daf623fef5b1b4e3fc375ace130253e38243" },
        },
        latest = "0.1.1",

        needs_build = false,
        license = "NONE",

        -- Upstream ships no redistributable license, so this index has
        -- no right to mirror it: no `mirror` block, installs straight
        -- from git, and it cannot be recovered if upstream disappears.
    },
}
