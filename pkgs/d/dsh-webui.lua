package = {
    spec = "1",

    name = "dsh-webui",
    description = "DeepSeek Harness 会话增强全家桶：定时自动化任务引擎（cron 调度·绑定模型真实执行·Agent 建议确认）、会话产物卡片、对话退回与文件回退/修改历史对比、视图图块与消息导航、工具调用聚合、Markdown 渲染、模型推理等级同步与 Developer Role 兼容检测、AnySearch 网页搜索、本地记忆（hybrid 检索）、用量工作台与 Token 预算、技能管理、文件浏览器、供应商设置、AI 浏览器、生图/辅助视觉、邮箱验证码、网络代理、任务完成提示音、审批提醒等。",
    repo = "https://github.com/statem-li/dsh-webui",
    homepage = "https://github.com/statem-li/dsh-webui",
    authors = {"statem-li"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@dsh-external/dsh-webui",

        versions = {
            ["0.5.1"] = { commit = "b6d2bdcc6ca0690d50c37f7da1198dae1dbddb47" },
        },
        latest = "0.5.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
