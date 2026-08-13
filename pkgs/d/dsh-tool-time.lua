package = {
    spec = "1",

    name = "dsh-tool-time",
    description = "DSH 时间工具插件：严格 ISO 8601 解析、IANA 时区转换、UTC 日历运算、固定时长差，零依赖",
    repo = "https://github.com/omdsh-dev/dsh-tool-time",
    homepage = "https://github.com/omdsh-dev/dsh-tool-time",
    licenses = {"MIT"},
    authors = {"omdsh-dev"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh", "plugin"},

    dsh = {
        bundle_name = "@deepseek-ai/dsh-tool-time",
        source = "github",
        origin = "omdsh-dev/dsh-tool-time",

        versions = {
            ["0.0.1"] = { ref = "96d080330afb50adc44be2a50b58b1ce6f25d147" },
        },
        latest = "0.0.1",

        needs_build = false,
        license = "MIT",

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
