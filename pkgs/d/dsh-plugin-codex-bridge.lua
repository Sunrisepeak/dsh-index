package = {
    spec = "1",

    name = "dsh-plugin-codex-bridge",
    description = "Bridge codex skills and config into DeepSeek Harness",
    repo = "https://github.com/YYTbit/dsh-plugin-codex-bridge",
    homepage = "https://github.com/YYTbit/dsh-plugin-codex-bridge",
    licenses = {"MIT"},
    authors = {"YYTbit"},

    status = "dev",
    categories = {"dsh-plugin", "skills", "provider"},
    keywords = {"dsh", "codex"},

    dsh = {
        bundle_name = "dsh-plugin-codex-bridge",
        source = "github",
        origin = "YYTbit/dsh-plugin-codex-bridge",

        versions = {
            ["0.1.0"] = { ref = "949f31ad7f0fee0ff06831cf67e3385e3a923eb0" },
        },
        latest = "0.1.0",

        needs_build = true,
        license = "MIT",

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
