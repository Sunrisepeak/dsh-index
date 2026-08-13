package = {
    spec = "1",

    name = "dsh-computer-use",
    description = "为 DeepSeek Harness 提供电脑控制插件：新鲜 Accessibility 观测、过期状态拒绝、作用域权限与安全输入（目前支持macos）｜Accessibility-first macOS Compute",
    repo = "https://github.com/Anionex/dsh-computer-use",
    homepage = "https://github.com/Anionex/dsh-computer-use",
    licenses = {"MIT"},
    authors = {"Anionex"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh", "plugin"},

    dsh = {
        bundle_name = "@dsh-external/dsh-computer-use",
        source = "github",
        origin = "Anionex/dsh-computer-use",

        versions = {
            ["0.1.0"] = { ref = "56a9605e69737bca24e3dface29de7498cf29d96" },
        },
        latest = "0.1.0",

        needs_build = false,
        license = "MIT",

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
