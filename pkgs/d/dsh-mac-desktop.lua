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

        -- The package stays because the bytes did. `tools/discover.py --audit`
        -- found the upstream gone on 2026-08-15; 0.1.0 is mirrored with a
        -- sha256 and a CN release, so installing it still works and nothing
        -- downstream broke. Deleting the descriptor would throw away a copy
        -- this index already holds -- but a reader following `repo` above hits
        -- a 404, so say why.
        upstream = {
            { date = "2026-08-15", event = "gone",
              note = "上游仓库 bitterSmilezzz/dsh-mac-desktop 已从 GitHub 消失"
                  .. "（整个仓库 404，非 force push）。0.1.0 已镜像到 xlings-res，"
                  .. "`xlings install dsh:dsh-mac-desktop` 照常可用；但不会再有新版本，"
                  .. "上游的 issue、文档与源码都已无法访问。" },
        },
    },
}
