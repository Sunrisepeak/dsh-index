package = {
    spec = "1",

    name = "dsh-data-insight",
    description = "数据洞察技能插件：CSV / 粘贴表格 / SQL 结果 / DuckDB 直连 → 带业务结论、指标与图表的结构化 Markdown 报告",
    repo = "https://github.com/duyanta123/dsh-data-insight",
    homepage = "https://github.com/duyanta123/dsh-data-insight",
    licenses = {"MIT"},
    authors = {"duyanta123"},

    status = "dev",
    categories = {"dsh-plugin", "data-analysis", "skills"},
    keywords = {"dsh", "csv", "duckdb", "report", "analysis"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-data-insight",

        versions = {
            ["0.1.1"] = { commit = "bbef09e12341e51d914d28b05c37c2c2486d770f" },
            ["0.1.2"] = { commit = "1f112cb0a8237a8ed072fd8ff7758aaca265d999" },
        },
        latest = "0.1.2",

        needs_build = false,

        -- MIT permits redistribution; the mirror block is filled in by
        -- tools/mirror.py at publish time, not hand-written.
    },
}
