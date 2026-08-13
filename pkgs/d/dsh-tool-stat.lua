package = {
    spec = "1",

    name = "dsh-tool-stat",
    description = "DSH 统计工具插件：描述统计/百分位数/频数分布/相关性，零依赖纯函数确定性",
    repo = "https://github.com/omdsh-dev/dsh-tool-stat",
    homepage = "https://github.com/omdsh-dev/dsh-tool-stat",
    licenses = {"MIT"},
    authors = {"omdsh-dev"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh", "plugin"},

    dsh = {
        bundle_name = "@deepseek-ai/dsh-tool-stat",
        source = "github",
        origin = "omdsh-dev/dsh-tool-stat",

        versions = {
            ["0.0.1"] = { ref = "bdc942b1599e45f115244950bb7c25e1575b364d" },
        },
        latest = "0.0.1",

        needs_build = false,
        license = "MIT",

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
