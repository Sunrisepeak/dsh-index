package = {
    spec = "1",

    name = "dsh-openai-codex-auth",
    description = "OpenAI Codex OAuth login and usage card plugin for DeepSeek Harness",
    repo = "https://github.com/yoke233/dsh-openai-codex-auth",
    homepage = "https://github.com/yoke233/dsh-openai-codex-auth",
    licenses = {"MIT"},
    authors = {"yoke233"},

    status = "dev",
    categories = {"dsh-plugin", "provider"},
    keywords = {"dsh", "openai-codex"},

    dsh = {
        bundle_name = "dsh-openai-codex-auth",
        source = "github",
        origin = "yoke233/dsh-openai-codex-auth",

        versions = {
            ["0.2.0"] = { ref = "0beaeb17a8971a3f442297403ae9a90493d70d77" },
        },
        latest = "0.2.0",

        needs_build = false,
        license = "MIT",

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
