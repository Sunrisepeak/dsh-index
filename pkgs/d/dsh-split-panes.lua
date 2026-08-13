package = {
    spec = "1",

    name = "dsh-split-panes",
    description = "dsh plugin from lehhair/dsh-split-panes",
    repo = "https://github.com/lehhair/dsh-split-panes",
    homepage = "https://github.com/lehhair/dsh-split-panes",
    licenses = {"BSD-3-Clause"},
    authors = {"lehhair"},

    status = "dev",
    categories = {"dsh-plugin", "uncategorized"},
    keywords = {"dsh", "split", "panes"},

    dsh = {
        bundle_name = "@dsh-external/dsh-split-panes",
        source = "github",
        origin = "lehhair/dsh-split-panes",

        versions = {
            ["0.1.0"] = { ref = "93379cd4c8026d58c9978caebaf67fad3d468b97" },
        },
        latest = "0.1.0",

        needs_build = false,
        license = "BSD-3-Clause",

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
