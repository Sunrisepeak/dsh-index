package = {
    spec = "1",

    name = "dsh-ci-co-pilot",
    description = "GitHub CI 副驾插件：PR 审查 / CI 失败修复 / Issue 分类 / 发版说明。 / GitHub CI co-pilot: PR review, CI failure fixing, issue triage and release notes.",
    repo = "https://github.com/temotee2103/dsh-ci-co-pilot",
    homepage = "https://github.com/temotee2103/dsh-ci-co-pilot",
    licenses = {"MIT"},
    authors = {"temotee2103"},

    status = "dev",
    categories = {"dsh-plugin", "tool"},
    keywords = {"dsh", "github", "ci", "pr-review", "release-notes", "issue-triage", "coding-agent"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@dsh-external/dsh-ci-co-pilot",

        versions = {
            ["0.1.0"] = { commit = "e86348c52323defad527cdc2ff11203634e0dfd8" },
        },
        latest = "0.1.0",

        -- Plain ESM JavaScript with no prepare/build script.
        needs_build = false,
    },
}
