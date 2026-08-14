package = {
    spec = "1",

    name = "dsh-mac-desktop",
    description = "DeepSeek Harness plugin: open the Web GUI in a native macOS desktop window (SwiftUI + WKWebView).",
    repo = "https://github.com/bitterSmilezzz/dsh-mac-desktop",
    homepage = "https://github.com/bitterSmilezzz/dsh-mac-desktop",
    licenses = {"MIT"},
    authors = {"bitterSmilezzz"},

    status = "dev",
    categories = {"dsh-plugin", "tui", "desktop"},
    keywords = {"dsh", "macos"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-mac-desktop",

        versions = {
            ["0.1.0"] = { commit = "64b69f125139adc4310fd12a66e5051f4cd4bc89" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- Published by tools/mirror.py to GitHub and GitCode, verified
        -- three ways: local build, GLOBAL and CN all hash the same.
        mirror = {
            ["0.1.0"] = {
                tarball = "dsh-mac-desktop-0.1.0.tgz",
                sha256  = "aa90e3d9d025e9cae812f338159ae2e9d2514351535307ba9995c04f5b6347c2",
                cn      = true,
            },
        },
    },
}
