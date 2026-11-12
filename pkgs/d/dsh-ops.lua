package = {
    spec = "1",

    name = "dsh-ops",
    description = "Bash, PowerShell 7, and Rust-based tools for dsh on Windows to cut token usage. / 为windows的dsh提供bash、powershell7及rust的高性能tools来减少token消耗",
    repo = "https://github.com/T-Auto/dsh-ops",
    homepage = "https://github.com/T-Auto/dsh-ops",
    authors = {"T-Auto"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "desktop",

        bundle_name = "dsh-ops",

        versions = {
            ["0.2.7"] = { commit = "50f5881515f736179240fd62fe2cb0df15374851" },
        },
        latest = "0.2.7",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
