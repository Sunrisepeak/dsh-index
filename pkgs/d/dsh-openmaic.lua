package = {
    spec = "1",

    name = "dsh-openmaic",
    description = "OpenMAIC for DeepSeek Harness: classrooms, slides, interactive widgets, and Socratic teaching",
    repo = "https://github.com/THU-MAIC/dsh-openmaic",
    homepage = "https://github.com/THU-MAIC/dsh-openmaic",
    licenses = {"MIT"},
    authors = {"THU-MAIC"},

    status = "dev",
    categories = {"dsh-plugin", "vision"},
    keywords = {"dsh", "openmaic"},

    dsh = {
        bundle_name = "@openmaic/dsh-openmaic",

        versions = {
            ["0.4.0"] = { commit = "09c1693cfe83224db89fdd4abd245ac9174d3a05" },
        },
        latest = "0.4.0",

        needs_build = false,

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
