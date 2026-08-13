package = {
    spec = "1",

    name = "dsh-resume-plugin",
    description = "让 DeepSeek Harness 安全读取并继续 Codex 与 Claude Code 的历史会话。",
    repo = "https://github.com/Demogorgon314/dsh-resume-plugin",
    homepage = "https://github.com/Demogorgon314/dsh-resume-plugin",
    licenses = {"MIT"},
    authors = {"Demogorgon314"},

    status = "dev",
    categories = {"dsh-plugin", "session", "sandbox"},
    keywords = {"dsh", "resume", "plugin"},

    dsh = {
        bundle_name = "dsh-resume-plugin",
        source = "github",
        origin = "Demogorgon314/dsh-resume-plugin",

        versions = {
            ["0.1.0"] = { ref = "f14d34c02e2a5ba41247a5baf1524e4a2a7c38a0" },
        },
        latest = "0.1.0",

        needs_build = false,
        license = "MIT",

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
