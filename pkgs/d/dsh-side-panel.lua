package = {
    spec = "1",

    name = "dsh-side-panel",
    description = "DSH 侧边栏，集成文件浏览器、终端和 Git 审查，方便预览文件。",
    repo = "https://github.com/ccq1/dsh-side-panel",
    homepage = "https://github.com/ccq1/dsh-side-panel",
    licenses = {"BSD-3-Clause"},
    authors = {"ccq1"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh", "plugin"},

    dsh = {
        bundle_name = "@dsh-external/dsh-side-panel",
        source = "github",
        origin = "ccq1/dsh-side-panel",

        versions = {
            ["0.2.0"] = { ref = "21fb43b1c739a0e22e9b695ee9845c07d5312246" },
        },
        latest = "0.2.0",

        needs_build = true,
        license = "BSD-3-Clause",

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
