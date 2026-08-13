package = {
    spec = "1",

    name = "openflowframes",
    description = "dsh plugin from ZeroHackz/OpenFlowFrames",
    repo = "https://github.com/ZeroHackz/OpenFlowFrames",
    homepage = "https://github.com/ZeroHackz/OpenFlowFrames",
    licenses = {"GPL-3.0"},
    authors = {"ZeroHackz"},

    status = "dev",
    categories = {"dsh-plugin", "uncategorized"},
    keywords = {"dsh", "openflowframes"},

    dsh = {
        bundle_name = "@zerohackz/dsh-openflowframes",
        source = "github",
        origin = "ZeroHackz/OpenFlowFrames",

        versions = {
            ["0.1.0"] = { ref = "f9b5087291a691dc02444b7d9dcff05033905a4d" },
        },
        latest = "0.1.0",

        needs_build = false,
        license = "GPL-3.0",

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
