package = {
    spec = "1",

    name = "dsh-flowglass",
    description = "流镜 Flowglass — DeepSeek Harness session flowgraph，实时可视化消息、工具组、子代理分支与步骤详情。",
    repo = "https://github.com/Iwctwbh/dsh-flowglass",
    homepage = "https://github.com/Iwctwbh/dsh-flowglass",
    licenses = {"MIT"},
    authors = {"Iwctwbh"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-flowglass",

        versions = {
            ["0.4.1"] = { commit = "2729c5f873ea7c5e9c99fb01fe3676bc3fdb4a33" },
        },
        latest = "0.4.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
