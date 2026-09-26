package = {
    spec = "1",

    name = "dsh-full-remote",
    description = "DeepSeek Harness plugin for remote access: a token-gated reverse proxy keeps settings, credentials, and file access working over public tunnels and on other devices instead of returning 403. Per-device sessions. 支持通过公网隧道或局域网，在手机等设备上远程使用 DeepSeek Harness，设置、凭据与文件访问等功能保持可用。",
    repo = "https://github.com/JUANWANG-BUAA/dsh-full-remote",
    homepage = "https://github.com/JUANWANG-BUAA/dsh-full-remote",
    licenses = {"MIT"},
    authors = {"JUANWANG-BUAA"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-full-remote",

        versions = {
            ["0.3.0"] = { commit = "252ba04f76911723a83478b1c727c9387d33bcc6" },
        },
        latest = "0.3.0",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
