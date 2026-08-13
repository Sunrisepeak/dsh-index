package = {
    spec = "1",

    name = "dsh-drag-and-drop",
    description = "为 DSH Web UI 增加跨平台文件拖拽与原始路径插入能力，无需复制文件",
    repo = "https://github.com/bill9109/dsh-drag-and-drop",
    homepage = "https://github.com/bill9109/dsh-drag-and-drop",
    licenses = {"BSD-3-Clause"},
    authors = {"bill9109"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh", "plugin"},

    dsh = {
        bundle_name = "@dsh-external/dsh-drag-and-drop",
        source = "github",
        origin = "bill9109/dsh-drag-and-drop",

        versions = {
            ["0.1.2"] = { ref = "00a77506ad80fa326af9e052bb4bbc067b1aa30e" },
        },
        latest = "0.1.2",

        needs_build = false,
        license = "BSD-3-Clause",

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
