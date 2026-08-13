package = {
    spec = "1",

    name = "dsh-visualize",
    description = "DSH 对话内生成式 UI 插件：模型把交互式 HTML 卡片直接画进会话流——visualize 工具 + 配套 skill + 沙箱渲染卡，带流式预览、组件浮入动画与鲸鱼蓝主题跟随",
    repo = "https://github.com/Nagi-ovo/dsh-visualize",
    homepage = "https://github.com/Nagi-ovo/dsh-visualize",
    authors = {"Nagi-ovo"},

    status = "dev",
    categories = {"dsh-plugin", "web-ui", "vision"},
    keywords = {"dsh", "visualize"},

    dsh = {
        bundle_name = "@dsh-external/dsh-visualize",

        versions = {
            ["0.1.2"] = { commit = "b80557ec9c4ab12857eca5ebe134beb48c575418" },
        },
        latest = "0.1.2",

        needs_build = false,

        -- Upstream ships no redistributable license, so this index has
        -- no right to mirror it: no `mirror` block, installs straight
        -- from git, and it cannot be recovered if upstream disappears.
    },
}
