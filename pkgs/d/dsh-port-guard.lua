package = {
    spec = "1",

    name = "dsh-port-guard",
    description = "DSH plugin: triage port conflicts (reuse / switch / precise kill) — 端口占用处置",
    repo = "https://github.com/PangYiMing/dsh-port-guard",
    homepage = "https://github.com/PangYiMing/dsh-port-guard",
    licenses = {"MIT"},
    authors = {"PangYiMing"},

    status = "dev",
    categories = {"dsh-plugin", "session", "sandbox"},
    keywords = {"dsh", "debugging", "devtools", "port"},

    dsh = {
        bundle_name = "dsh-port-guard",
        source = "github",
        origin = "PangYiMing/dsh-port-guard",

        versions = {
            ["0.1.0"] = { ref = "35911b26ff579bb1110497fe35dee3ece1e88540" },
        },
        latest = "0.1.0",

        needs_build = false,
        license = "MIT",

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
