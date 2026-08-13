package = {
    spec = "1",

    name = "dsh-sidechain",
    description = "DSH 侧会话插件：/side 持续性侧会话（Codex 风格）与 /btw 一次性侧问（Claude 风格）——在临时 fork 中运行、不写入主会话历史；Web UI 右侧链面板内嵌对话，主会话保持不变",
    repo = "https://github.com/Buyi-wsgzg/dsh-sidechain",
    homepage = "https://github.com/Buyi-wsgzg/dsh-sidechain",
    licenses = {"BSD-3-Clause"},
    authors = {"Buyi-wsgzg"},

    status = "dev",
    categories = {"dsh-plugin", "web-ui", "session"},
    keywords = {"dsh", "side-conversation", "sidechain"},

    dsh = {
        bundle_name = "@dsh-external/dsh-sidechain",
        source = "github",
        origin = "Buyi-wsgzg/dsh-sidechain",

        versions = {
            ["0.6.2"] = { ref = "dd4e1a712d0d34bf59aac2df09f0846e09e3e5f2" },
        },
        latest = "0.6.2",

        needs_build = false,
        license = "BSD-3-Clause",

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
