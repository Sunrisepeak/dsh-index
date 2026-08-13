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
        bundle_name = "dsh-tui",

        versions = {
            ["0.2.1"] = { commit = "a1325b76538f303af013883b712f6fecbde68160" },
        },
        latest = "0.2.1",

        needs_build = false,

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
