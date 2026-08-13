package = {
    spec = "1",

    name = "dsh-trace",
    description = "DeepSeek Harness telemetry backend that exports turns, model steps, and tool calls to yiTrace over HTTP.",
    repo = "https://github.com/vibeinging/dsh-trace",
    homepage = "https://github.com/vibeinging/dsh-trace",
    licenses = {"BSD-3-Clause"},
    authors = {"vibeinging"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh", "plugin"},

    dsh = {
        bundle_name = "@deepseek-ai/dsh-trace",
        source = "github",
        origin = "vibeinging/dsh-trace",

        versions = {
            ["0.0.1"] = { ref = "caadf1b831ae2643bd25a365cc1356c2100e7a05" },
        },
        latest = "0.0.1",

        needs_build = false,
        license = "BSD-3-Clause",

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
