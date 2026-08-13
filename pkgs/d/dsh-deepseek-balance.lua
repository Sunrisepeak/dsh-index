package = {
    spec = "1",

    name = "dsh-deepseek-balance",
    description = "DeepSeek API 余额监视器：DSH 右下角悬浮徽章 + 7天/30天用量费用图表",
    repo = "https://github.com/lin-cheng-lab/dsh-deepseek-balance",
    homepage = "https://github.com/lin-cheng-lab/dsh-deepseek-balance",
    licenses = {"MIT"},
    authors = {"lin-cheng-lab"},

    status = "dev",
    categories = {"dsh-plugin", "provider"},
    keywords = {"dsh", "deepseek", "balance"},

    dsh = {
        bundle_name = "dsh-deepseek-balance",
        source = "github",
        origin = "lin-cheng-lab/dsh-deepseek-balance",

        versions = {
            ["0.1.0"] = { ref = "543f04dbb82a64db1e92ef968d86a058e0c9dd6a" },
        },
        latest = "0.1.0",

        needs_build = true,
        license = "MIT",

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
