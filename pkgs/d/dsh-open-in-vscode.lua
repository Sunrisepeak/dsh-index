package = {
    spec = "1",

    name = "dsh-open-in-vscode",
    description = "Open DeepSeek Harness workspace directories in VS Code directly from the web GUI.",
    repo = "https://github.com/omdsh-dev/dsh-open-in-vscode",
    homepage = "https://github.com/omdsh-dev/dsh-open-in-vscode",
    licenses = {"MIT"},
    authors = {"omdsh-dev"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh", "plugin"},

    dsh = {
        bundle_name = "dsh-open-in-vscode",
        source = "github",
        origin = "omdsh-dev/dsh-open-in-vscode",

        versions = {
            ["0.1.0"] = { ref = "149f21aed3d05d2b392206394c4a023e35d694c7" },
        },
        latest = "0.1.0",

        needs_build = true,
        license = "MIT",

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
