package = {
    spec = "1",

    name = "dsh-turn-rewind",
    description = "deepseek harness对话回退插件 | DSH — rewind conversation and workspace state, powered by a persistent Change Ledger",
    repo = "https://github.com/Anionex/dsh-turn-rewind",
    homepage = "https://github.com/Anionex/dsh-turn-rewind",
    licenses = {"BSD-3-Clause"},
    authors = {"Anionex"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh", "plugin"},

    dsh = {
        bundle_name = "@dsh-external/turn-rewind",
        source = "github",
        origin = "Anionex/dsh-turn-rewind",

        versions = {
            ["0.1.0"] = { ref = "55cf4a842a7f177cd6f42f3243603e61385e0c29" },
        },
        latest = "0.1.0",

        needs_build = false,
        license = "BSD-3-Clause",

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
