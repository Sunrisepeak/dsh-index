package = {
    spec = "1",

    name = "dsh-tool-schema",
    description = "DSH JSON Schema 验证工具插件：validate/paths/explain/normalize，零网络零动态执行",
    repo = "https://github.com/omdsh-dev/dsh-tool-schema",
    homepage = "https://github.com/omdsh-dev/dsh-tool-schema",
    licenses = {"MIT"},
    authors = {"omdsh-dev"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh", "plugin"},

    dsh = {
        bundle_name = "@deepseek-ai/dsh-tool-schema",
        source = "github",
        origin = "omdsh-dev/dsh-tool-schema",

        versions = {
            ["0.0.1"] = { ref = "8539ae39cadbdff20c2b36a7885f16399bcfc8ea" },
        },
        latest = "0.0.1",

        needs_build = false,
        license = "MIT",

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
