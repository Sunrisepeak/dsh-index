package = {
    spec = "1",

    name = "dsh-interconnect",
    description = "Cross-instance message/event handoff plugins for DSH (interconnect service + tools)",
    repo = "https://github.com/Chinesezjc/dsh-interconnect",
    homepage = "https://github.com/Chinesezjc/dsh-interconnect",
    licenses = {"MIT"},
    authors = {"Chinesezjc"},

    status = "dev",
    categories = {"dsh-plugin", "workflow"},
    keywords = {"dsh", "interconnect"},

    dsh = {
        bundle_name = "dsh-interconnect",
        source = "github",
        origin = "Chinesezjc/dsh-interconnect",

        versions = {
            ["0.1.0"] = { ref = "07ca402da2f1067103553b6da8316243d11e4e71" },
        },
        latest = "0.1.0",

        needs_build = false,
        license = "MIT",

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
