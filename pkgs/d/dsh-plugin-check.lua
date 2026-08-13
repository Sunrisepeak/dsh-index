package = {
    spec = "1",

    name = "dsh-plugin-check",
    description = "DSH 插件健康检查工具：扫描插件仓库的清单协议 / patch 格式 / 构建陷阱 / hub 收录状态，零依赖只读，注册 plugin_check 工具",
    repo = "https://github.com/omdsh-dev/dsh-plugin-check",
    homepage = "https://github.com/omdsh-dev/dsh-plugin-check",
    licenses = {"MIT"},
    authors = {"omdsh-dev"},

    status = "dev",
    categories = {"dsh-plugin", "tools", "session"},
    keywords = {"dsh", "diagnostics", "linting", "plugin-health"},

    dsh = {
        bundle_name = "@deepseek-ai/dsh-plugin-check",
        source = "github",
        origin = "omdsh-dev/dsh-plugin-check",

        versions = {
            ["0.0.1"] = { ref = "636c1dbcf113b041f166fc64db88d0d4efc25762" },
        },
        latest = "0.0.1",

        needs_build = false,
        license = "MIT",

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
