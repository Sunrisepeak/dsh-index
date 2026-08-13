package = {
    spec = "1",

    name = "jumpserver-dsh",
    description = "DeepSeek Harness plugin: manage JumpServer assets and operate on them through KoKo",
    repo = "https://github.com/jumpserver-east/jumpserver-dsh",
    homepage = "https://github.com/jumpserver-east/jumpserver-dsh",
    licenses = {"MIT"},
    authors = {"jumpserver-east"},

    status = "dev",
    categories = {"dsh-plugin", "uncategorized"},
    keywords = {"dsh", "jumpserver"},

    dsh = {
        bundle_name = "dsh-jumpserver",
        source = "github",
        origin = "jumpserver-east/jumpserver-dsh",

        versions = {
            ["0.1.0"] = { ref = "334c4688e6623b7a497e8dee15aa1c111486b3b0" },
        },
        latest = "0.1.0",

        needs_build = true,
        license = "MIT",

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
