package = {
    spec = "1",

    name = "dsh-cc-tui",
    description = "Claude Code style full-screen terminal UI",
    repo = "https://github.com/ccch1mneyyy/dsh-cc-tui",
    homepage = "https://github.com/ccch1mneyyy/dsh-cc-tui",
    licenses = {"BSD-3-Clause"},
    authors = {"ccch1mneyyy"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh", "plugin", "tui", "terminal"},

    dsh = {
        bundle_name = "dsh-cc-tui",
        source = "github",
        origin = "ccch1mneyyy/dsh-cc-tui",

        versions = {
            ["0.1.2"] = { ref = "4aa91903ed71a2a4ce9050978f4f3e92ec4314e1" },
        },
        latest = "0.1.2",

        needs_build = false,
        license = "BSD-3-Clause",

        -- Mirror-eligible. The `mirror` block is filled in by the mirror
        -- pipeline once a tarball is published to xlings-res; until then
        -- this package installs via architecture A.
    },
}
