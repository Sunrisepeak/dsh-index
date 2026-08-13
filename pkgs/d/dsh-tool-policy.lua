package = {
    spec = "1",

    name = "dsh-tool-policy",
    description = "Declarative deny-by-default tool policy plugin for DeepSeek Harness",
    repo = "https://github.com/Drifter-yh/dsh-tool-policy",
    homepage = "https://github.com/Drifter-yh/dsh-tool-policy",
    licenses = {"MIT"},
    authors = {"Drifter-yh"},

    status = "dev",
    categories = {"dsh-plugin", "tools"},
    keywords = {"dsh", "agent", "agent-infrastructure", "tool-policy"},

    dsh = {
        bundle_name = "dsh-tool-policy",
        source = "github",
        origin = "Drifter-yh/dsh-tool-policy",

        versions = {
            ["0.1.0"] = { ref = "35a5ba3ee291e0e3562fd61055c3efb39679c6ca" },
        },
        latest = "0.1.0",

        needs_build = false,
        license = "MIT",

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
