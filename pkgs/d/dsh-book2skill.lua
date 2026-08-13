package = {
    spec = "1",

    name = "dsh-book2skill",
    description = "DSH book-to-skill plugin: a 5-stage long task (fetch → parse → understand → generate → install) with 3 human g",
    repo = "https://github.com/omdsh-dev/dsh-book2skill",
    homepage = "https://github.com/omdsh-dev/dsh-book2skill",
    licenses = {"BSD-3-Clause"},
    authors = {"omdsh-dev"},

    status = "dev",
    categories = {"dsh-plugin", "skills"},
    keywords = {"dsh", "book2skill"},

    dsh = {
        bundle_name = "dsh-book2skill",
        source = "github",
        origin = "omdsh-dev/dsh-book2skill",

        versions = {
            ["0.1.2"] = { ref = "279a972696392332944a7f6b6c1d5e895238f80f" },
        },
        latest = "0.1.2",

        needs_build = false,
        license = "BSD-3-Clause",

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
