package = {
    spec = "1",

    name = "custom-first-control-prompt",
    description = "DeepSeek Harness plugin for insert custom prompt",
    repo = "https://github.com/WM-CODER/custom-first-control-prompt",
    homepage = "https://github.com/WM-CODER/custom-first-control-prompt",
    licenses = {"MIT"},
    authors = {"WM-CODER"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@wm-coders/dsh-custom-first-control-prompt",

        versions = {
            ["0.2.1"] = { commit = "c9c98359854fcf99ec2be417fc70b4bef623e802" },
        },
        latest = "0.2.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
