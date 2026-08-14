package = {
    spec = "1",

    name = "dsh-tui",
    description = "A small, session-aware terminal UI for DeepSeek Harness",
    repo = "https://github.com/orriduck/dsh-tui",
    homepage = "https://github.com/orriduck/dsh-tui",
    licenses = {"MIT"},
    authors = {"orriduck"},

    status = "dev",
    categories = {"dsh-plugin", "tui", "session"},
    keywords = {"dsh", "coding-agent", "tui"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "tui",

        bundle_name = "dsh-tui",

        versions = {
            ["0.2.1"] = { commit = "a1325b76538f303af013883b712f6fecbde68160" },
        },
        latest = "0.2.1",

        -- Base rows this bundle replaces. Another bundle patching
        -- any of these in the same profile silently wins or loses,
        -- depending on install order.
        overrides = {"hmr", "system-prompt", "tools"},
        needs_build = false,

        -- Published by tools/mirror.py to GitHub and GitCode, verified
        -- three ways: local build, GLOBAL and CN all hash the same.
        mirror = {
            ["0.2.1"] = {
                tarball = "dsh-tui-0.2.1.tgz",
                sha256  = "6538c1b67bb416de2fb7ae3502e9e20740ab8b082b74305ac4fc7633d484d2b6",
                cn      = true,
            },
        },
    },
}
