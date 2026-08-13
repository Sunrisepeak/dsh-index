package = {
    spec = "1",

    name = "whale-girl",
    description = "DSH Web GUI 桌面宠物插件（QQ 宠物形态）：右下角悬浮、可拖拽/投喂/玩耍的积累型伙伴。官方 repository-plugin（.dsh-plugin 格式），config.yaml 安装：github:d",
    repo = "https://github.com/vlln/whale-girl",
    homepage = "https://github.com/vlln/whale-girl",
    licenses = {"MIT"},
    authors = {"vlln"},

    status = "dev",
    categories = {"dsh-plugin", "desktop", "web-ui"},
    keywords = {"dsh", "dsh-repository-plugin", "pet"},

    dsh = {
        bundle_name = "whale-girl",

        versions = {
            ["0.1.0"] = { commit = "ecba322be408138fcc265588cacf00737154d31e" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
