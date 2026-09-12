package = {
    spec = "1",

    name = "dsh-secure-audit",
    description = "Read-only security & compliance plugin for DeepSeek Harness: prompt-injection detection, Chinese-PII redaction, and local configuration audit with redacted, reproducible reports.",
    repo = "https://github.com/PensiveFei/dsh-secure-audit",
    homepage = "https://github.com/PensiveFei/dsh-secure-audit",
    licenses = {"MIT"},
    authors = {"PensiveFei"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-secure-audit",

        versions = {
            ["0.2.0"] = { commit = "3d7a48cd5140b27673c4a6f9a3b402706ccd0341" },
        },
        latest = "0.2.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
