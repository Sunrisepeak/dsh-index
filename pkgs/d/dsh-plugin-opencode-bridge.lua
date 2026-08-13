package = {
    spec = "1",

    name = "dsh-plugin-opencode-bridge",
    description = "Bridge opencode skills and config into DeepSeek Harness",
    repo = "https://github.com/YYTbit/dsh-plugin-opencode-bridge",
    homepage = "https://github.com/YYTbit/dsh-plugin-opencode-bridge",
    licenses = {"MIT"},
    authors = {"YYTbit"},

    status = "dev",
    categories = {"dsh-plugin", "skills"},
    keywords = {"dsh", "opencode"},

    dsh = {
        bundle_name = "dsh-plugin-opencode-bridge",
        source = "github",
        origin = "YYTbit/dsh-plugin-opencode-bridge",

        versions = {
            ["0.1.0"] = { ref = "27ec22d8080ca5bbff3df91acb30dd2bb6b088e3" },
        },
        latest = "0.1.0",

        needs_build = true,
        license = "MIT",

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
