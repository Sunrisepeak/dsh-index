package = {
    spec = "1",

    name = "dsh-tool-approval",
    description = "Manual approval for Deepseek Harness (aka \"Manual Mode\"/\"Ask Mode\")",
    repo = "https://github.com/ilharp/dsh-tool-approval",
    homepage = "https://github.com/ilharp/dsh-tool-approval",
    licenses = {"BSD-3-Clause"},
    authors = {"ilharp"},

    status = "dev",
    categories = {"dsh-plugin", "tools", "sandbox"},
    keywords = {"dsh", "tool", "approval"},

    dsh = {
        bundle_name = "dsh-tool-approval",

        versions = {
            ["0.1.0"] = { commit = "c01801a7e39c36515d8445747abff6a6388c1278" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
