package = {
    spec = "1",

    name = "modlens",
    description = "Vision plugin and vision bridge for DeepSeek Harness",
    repo = "https://github.com/liustack/modlens",
    homepage = "https://github.com/liustack/modlens",
    licenses = {"MIT"},
    authors = {"liustack"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh", "plugin", "vision", "bridge"},

    dsh = {
        bundle_name = "@liustack/modlens",
        source = "github",
        origin = "liustack/modlens",

        versions = {
            ["3.9.1"] = { ref = "6d933a09985e7a8b2a386a3d08b807289327ed6c" },
        },
        latest = "3.9.1",

        needs_build = false,
        license = "MIT",

        -- Mirror-eligible. The `mirror` block is filled in by the mirror
        -- pipeline once a tarball is published to xlings-res; until then
        -- this package installs via architecture A.
    },
}
