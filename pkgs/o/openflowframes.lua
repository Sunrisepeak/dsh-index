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

        versions = {
            ["0.1.0"] = { commit = "f9b5087291a691dc02444b7d9dcff05033905a4d" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
