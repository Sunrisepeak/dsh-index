package = {
    spec = "1",

    name = "dsh-update-checker",
    description = "DeepSeek Harness 主程序与插件更新管理：npm/GitHub 双源 semver 比对、多语言横幅、一键更新（主程序自动备份/校验/回滚，插件临时目录安装）、更新后看门狗重启。Update management for DeepSeek Harness and its plugins: dual-source semver checks, locale banner, one-click updates with backup/rollback, watchdog restart.",
    repo = "https://github.com/Airmetro/dsh-update-checker",
    homepage = "https://github.com/Airmetro/dsh-update-checker",
    licenses = {"MIT"},
    authors = {"Airmetro"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-update-checker",

        versions = {
            ["1.4.16"] = { commit = "a0605b4cfb94665e6937187789e73894ea0e4d5e" },
        },
        latest = "1.4.16",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
