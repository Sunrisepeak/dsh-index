package = {
    spec = "1",

    name = "dsh-skin",
    description = "Skin switcher + custom wallpaper for DeepSeek Harness (dsh): curated --dsw-alias-* palettes, translucent wallpaper with opacity/blur controls, persisted per browser (like Codex themes) — 换皮肤 / 自定义背景插件",
    repo = "https://github.com/KinGao294/dsh-skin",
    homepage = "https://github.com/KinGao294/dsh-skin",
    licenses = {"MIT"},
    authors = {"KinGao294"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-skin",

        versions = {
            ["0.4.0"] = { commit = "0a571a27adcc5f780b7b72386c9c294243eec5b3" },
            ["0.3.1"] = { commit = "65c79b09d4c5f23e72076ff6b6b6b26c883f935c" },
            ["0.2.0"] = { commit = "13554dfcb170cd0a629c0ed9b6b0cdce0b01e075" },
        },
        latest = "0.4.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
