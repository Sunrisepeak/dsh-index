package = {
    spec = "1",

    name = "dsh-mobile-gui-agent",
    description = "Android Mobile GUI Agent plugin for DeepSeek Harness with ADB control, iterative verification, approvals, and a Web mobile view",
    repo = "https://github.com/kunjinkao-os/dsh-mobile-gui-agent",
    homepage = "https://github.com/kunjinkao-os/dsh-mobile-gui-agent",
    licenses = {"MIT"},
    authors = {"kunjinkao-os"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-mobile-gui-agent",

        versions = {
            ["0.1.1"] = { commit = "f457206b13545d4cbeb33b4871f5bf06ff34ed7d" },
        },
        latest = "0.1.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
