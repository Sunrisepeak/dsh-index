package = {
    spec = "1",

    name = "dsh-tool-monitor",
    description = "Monitor existing DeepSeek Harness background jobs without running commands twice",
    repo = "https://github.com/yoke233/dsh-tool-monitor",
    homepage = "https://github.com/yoke233/dsh-tool-monitor",
    licenses = {"MIT"},
    authors = {"yoke233"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh", "plugin"},

    dsh = {
        bundle_name = "dsh-tool-monitor",
        source = "github",
        origin = "yoke233/dsh-tool-monitor",

        versions = {
            ["0.1.0"] = { ref = "707b3f4ed8fc2301393dccdf537d531d128d449c" },
        },
        latest = "0.1.0",

        needs_build = false,
        license = "MIT",

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
