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
        source = "github",
        origin = "YYTbit/dsh-plugin-claude-bridge",

        versions = {
            ["0.1.0"] = { ref = "ba9bc23b9210984e035559e6da1980698c07cc28" },
        },
        latest = "0.1.0",

        needs_build = true,
        license = "MIT",

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
