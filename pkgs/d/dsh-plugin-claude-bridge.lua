package = {
    spec = "1",

    name = "dsh-plugin-claude-bridge",
    description = "Bridge Claude Code memory, skills, and config into DeepSeek Harness",
    repo = "https://github.com/YYTbit/dsh-plugin-claude-bridge",
    homepage = "https://github.com/YYTbit/dsh-plugin-claude-bridge",
    licenses = {"MIT"},
    authors = {"YYTbit"},

    status = "dev",
    categories = {"dsh-plugin", "memory", "skills"},
    keywords = {"dsh", "claude-code", "memory"},

    dsh = {
        bundle_name = "dsh-plugin-claude-bridge",

        versions = {
            ["0.1.0"] = { commit = "ba9bc23b9210984e035559e6da1980698c07cc28" },
        },
        latest = "0.1.0",

        needs_build = true,

        -- Published by tools/mirror.py to GitHub and GitCode, verified
        -- three ways: local build, GLOBAL and CN all hash the same.
        mirror = {
            ["0.1.0"] = {
                tarball = "dsh-plugin-claude-bridge-0.1.0.tgz",
                sha256  = "492d782c4a4b24cbf067fba8271e8e9e724e04e9d837ffc5daabbc619d55a0e0",
                cn      = true,
            },
        },
    },
}
