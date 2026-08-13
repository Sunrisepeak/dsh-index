package = {
    spec = "1",

    name = "dsh-vision-toolkit",
    description = "Helps text-only models handle vision tasks",
    repo = "https://github.com/Anionex/dsh-vision-toolkit",
    homepage = "https://github.com/Anionex/dsh-vision-toolkit",
    licenses = {"MIT"},
    authors = {"Anionex"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh", "plugin", "vision", "toolkit"},

    dsh = {
        bundle_name = "@dsh-external/dsh-vision-toolkit",
        source = "github",
        origin = "Anionex/dsh-vision-toolkit",

        versions = {
            ["0.1.2"] = { ref = "091d8631eee0228df89c623598d3537b61618cb3" },
        },
        latest = "0.1.2",

        needs_build = false,
        license = "MIT",

        -- Mirror-eligible. The `mirror` block is filled in by the mirror
        -- pipeline once a tarball is published to xlings-res; until then
        -- this package installs via architecture A.
    },
}
