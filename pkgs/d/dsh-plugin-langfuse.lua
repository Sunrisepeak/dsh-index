package = {
    spec = "1",

    name = "dsh-plugin-langfuse",
    description = "Langfuse observability for DeepSeek Harness (dsh): exports agent sessions as OpenTelemetry trace trees (GenAI semconv) to Langfuse's OTLP endpoint",
    repo = "https://github.com/linyp/dsh-plugin-langfuse",
    homepage = "https://github.com/linyp/dsh-plugin-langfuse",
    licenses = {"MIT"},
    authors = {"linyp"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-plugin-langfuse",

        versions = {
            ["0.1.0"] = { commit = "d5547a6e6bb6d12e042c0e804c0aeab33df60458" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
