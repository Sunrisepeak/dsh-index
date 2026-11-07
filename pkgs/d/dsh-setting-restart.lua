package = {
    spec = "1",

    name = "dsh-setting-restart",
    description = "One-click restart of the DSH service from Settings → General. A dsh-plugin for DeepSeek Harness; the restart row stays pinned at the bottom of the general settings page.  在设置 → 通用设置中一键重启 DSH 服务。DeepSeek Harness 的 dsh-plugin，重启行固定显示在通用设置页面最底部。",
    repo = "https://github.com/893413974-bit/dsh-setting-restart",
    homepage = "https://github.com/893413974-bit/dsh-setting-restart",
    licenses = {"MIT"},
    authors = {"893413974-bit"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-setting-restart",

        versions = {
            ["1.0.0"] = { commit = "ede6d2dc68f87c395c9e5e932cc1609a1ae0cb61" },
        },
        latest = "1.0.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
