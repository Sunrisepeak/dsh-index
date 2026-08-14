package = {
    spec = "1",

    name = "dsh-eval-harness",
    description = "DSH 插件评测工具：YAML 用例驱动真实 agent 回归评测 + baseline 对比 PASS/WARN/FAIL 门禁｜Regression eval harness for DeepSeek Harness plugins",
    repo = "https://github.com/BiBoyang/dsh-eval-harness",
    homepage = "https://github.com/BiBoyang/dsh-eval-harness",
    authors = {"BiBoyang"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "headless",

        bundle_name = "dsh-eval-harness",

        versions = {
            ["0.3.0"] = { commit = "035d1c6e1ebf918bbb7bc2a83fd3173af15ea693" },
        },
        latest = "0.3.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
