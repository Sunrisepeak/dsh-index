package = {
    spec = "1",

    name = "dsh-data-insight",
    description = "美妆电商可解释数据分析技能插件：CSV / 粘贴表格 / SQL 结果 / DuckDB 直连 → 带业务结论、指标与图表的结构化 Markdown 报告；内置美妆垂直指标字典、周报模板、演示数据集、报告校验器与朴素预测基线",
    repo = "https://github.com/duyanta123/dsh-data-insight",
    homepage = "https://github.com/duyanta123/dsh-data-insight",
    licenses = {"MIT"},
    authors = {"duyanta123"},

    status = "dev",
    categories = {"dsh-plugin", "data-analysis", "skills"},
    keywords = {"dsh", "csv", "duckdb", "report", "analysis", "beauty", "ecommerce"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-data-insight",

        versions = {
            ["0.1.8"] = { commit = "d09a4390c698b0e717513db56e8559d15f5eba71" },
        },
        latest = "0.1.8",

        needs_build = false,

        -- MIT permits redistribution; the mirror block is filled in by
        -- tools/mirror.py at publish time, not hand-written.
    },
}
