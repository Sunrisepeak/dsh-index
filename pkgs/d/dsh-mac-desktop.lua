package = {
    spec = "1",

    name = "dsh-mac-desktop",
    description = "DeepSeek Harness plugin: open the Web GUI in a native macOS desktop window (SwiftUI + WKWebView).",
    repo = "https://github.com/bitterSmilezzz/dsh-mac-desktop",
    homepage = "https://github.com/bitterSmilezzz/dsh-mac-desktop",
    licenses = {"MIT"},
    authors = {"bitterSmilezzz"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh", "plugin"},

    dsh = {
        bundle_name = "dsh-mac-desktop",
        source = "github",
        origin = "bitterSmilezzz/dsh-mac-desktop",

        versions = {
            ["0.1.0"] = { ref = "64b69f125139adc4310fd12a66e5051f4cd4bc89" },
        },
        latest = "0.1.0",

        needs_build = false,
        license = "MIT",

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
