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
            ["0.1.3"] = { commit = "3ddd079037cc5b3598296f478554ecb0fc4863bc" },
            ["0.1.4"] = { commit = "2415a7df98764053603331a24fecc2b3bc6d9d83" },
            ["0.1.5"] = { commit = "4a9f3fef1bcaa2d4b3e3b0a4c1ea44d7bc65a573" },
            ["0.1.6"] = { commit = "7331b3d40ac9a3d96af4ea79c94db4a1a8ab9ebb" },
        },
        latest = "0.1.6",

        needs_build = false,

        -- MIT permits redistribution; the mirror block is filled in by
        -- tools/mirror.py at publish time, not hand-written.
    },
}
