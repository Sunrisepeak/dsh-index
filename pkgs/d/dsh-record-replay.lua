package = {
    spec = "1",

    name = "dsh-record-replay",
    description = "DeepSeek Harness record macOS desktop workflows by demonstration and turn them into agent skills (open-record-",
    repo = "https://github.com/humblebanana/dsh-record-replay",
    homepage = "https://github.com/humblebanana/dsh-record-replay",
    licenses = {"MIT"},
    authors = {"humblebanana"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh", "plugin"},

    dsh = {
        bundle_name = "dsh-record-replay",
        source = "github",
        origin = "humblebanana/dsh-record-replay",

        versions = {
            ["0.1.0"] = { ref = "32d06f7db906914e278d1552728d1d63f191d6ad" },
        },
        latest = "0.1.0",

        needs_build = false,
        license = "MIT",

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
