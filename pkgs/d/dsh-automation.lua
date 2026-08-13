package = {
    spec = "1",

    name = "dsh-automation",
    description = "DSH 自动化插件：让 Coding 任务按计划在全新 Agent Session 中运行，并由用户或 Agent 创建和管理定时任务。 / Run coding tasks in fresh Agent session",
    repo = "https://github.com/titanwings/dsh-automation",
    homepage = "https://github.com/titanwings/dsh-automation",
    licenses = {"MIT"},
    authors = {"titanwings"},

    status = "dev",
    categories = {"dsh-plugin", "workflow", "session"},
    keywords = {"dsh", "automation", "coding-agent", "cordis", "scheduled-tasks"},

    dsh = {
        bundle_name = "@dsh-external/dsh-automation",

        versions = {
            ["0.1.5"] = { commit = "3c0188d7d94ed5b1e8caffeb73d7ac7ab34aabb3" },
        },
        latest = "0.1.5",

        needs_build = false,

        -- Published by tools/mirror.py to GitHub and GitCode, verified
        -- three ways: local build, GLOBAL and CN all hash the same.
        mirror = {
            ["0.1.5"] = {
                tarball = "dsh-automation-0.1.5.tgz",
                sha256  = "9ecf8e4aff3c7bc2807498785693296e2a4ea7ea31fb5ca5e60fcfecd5ec53e6",
                cn      = true,
            },
        },
    },
}
