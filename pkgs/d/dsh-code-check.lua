package = {
    spec = "1",

    name = "dsh-code-check",
    description = "dsh plugin from a179-sanae/dsh-code-check",
    repo = "https://github.com/a179-sanae/dsh-code-check",
    homepage = "https://github.com/a179-sanae/dsh-code-check",
    licenses = {"BSD-3-Clause"},
    authors = {"a179-sanae"},

    status = "dev",
    categories = {"dsh-plugin", "sandbox"},
    keywords = {"dsh", "code", "check"},

    dsh = {
        bundle_name = "@a179-sanae/dsh-code-check",
        source = "github",
        origin = "a179-sanae/dsh-code-check",

        versions = {
            ["0.1.0"] = { ref = "8b28f145aaa282ce57b946303074109f1aa1bad0" },
        },
        latest = "0.1.0",

        needs_build = true,
        license = "BSD-3-Clause",

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
