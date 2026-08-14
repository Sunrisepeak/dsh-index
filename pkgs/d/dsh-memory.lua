package = {
    spec = "1",

    name = "dsh-memory",
    description = "律的跨会话记忆插件：SQLite FTS5 全文检索 + memory 工具 + 后台沉淀（定期总结/纠错即时捕获），蒸馏自 pi-hermes-memory。",
    repo = "https://github.com/ralfsqual/dsh-memory",
    homepage = "https://github.com/ralfsqual/dsh-memory",
    licenses = {"MIT"},
    authors = {"ralfsqual"},

    status = "dev",
    categories = {"dsh-plugin", "memory", "tools"},
    keywords = {"dsh", "memory", "sqlite", "fts5", "cross-session", "persistent-memory", "correction", "review", "cordis"},

    dsh = {
        kind = "plugin",
        profile = "web",

        bundle_name = "dsh-memory",

        versions = {
            ["0.1.0"] = { commit = "e06219d38c9a613999da20caf99f104723ddc19c" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
