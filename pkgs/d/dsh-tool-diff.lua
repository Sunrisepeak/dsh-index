package = {
    spec = "1",

    name = "dsh-tool-diff",
    description = "DSH Diff 工具插件：文本/JSON/CSV/Markdown 结构化比较与 unified diff，零依赖只读，注册 diff 工具",
    repo = "https://github.com/omdsh-dev/dsh-tool-diff",
    homepage = "https://github.com/omdsh-dev/dsh-tool-diff",
    licenses = {"MIT"},
    authors = {"omdsh-dev"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh", "plugin"},

    dsh = {
        bundle_name = "@deepseek-ai/dsh-tool-diff",
        source = "github",
        origin = "omdsh-dev/dsh-tool-diff",

        versions = {
            ["0.0.1"] = { ref = "75ba266216f56d22b0541bac1e8fd338bfa740c0" },
        },
        latest = "0.0.1",

        needs_build = false,
        license = "MIT",

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
