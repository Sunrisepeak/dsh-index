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

        versions = {
            ["0.2.0"] = { commit = "0beaeb17a8971a3f442297403ae9a90493d70d77" },
        },
        latest = "0.2.0",

        needs_build = false,

        -- Published by tools/mirror.py to GitHub and GitCode, verified
        -- three ways: local build, GLOBAL and CN all hash the same.
        mirror = {
            ["0.2.0"] = {
                tarball = "dsh-openai-codex-auth-0.2.0.tgz",
                sha256  = "32c5a0e7cee7424b6169b631fb3cbf9afa7bf68d651f649b5ef1254adcf6879e",
                cn      = true,
            },
        },
    },
}
