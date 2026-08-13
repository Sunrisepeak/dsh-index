package = {
    spec = "1",

    name = "dsh-ads",
    description = "2005-era Chinese web ad styling for the dsh Web UI",
    repo = "https://github.com/Nagi-ovo/dsh-ads",
    homepage = "https://github.com/Nagi-ovo/dsh-ads",
    authors = {"Nagi-ovo"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh", "plugin", "webui", "fun"},

    dsh = {
        bundle_name = "@dsh-external/dsh-ads",
        source = "github",
        origin = "Nagi-ovo/dsh-ads",

        versions = {
            ["0.1.0"] = { ref = "35547f7001afd6b853c2010b196365f61eebf8f1" },
        },
        latest = "0.1.0",

        needs_build = false,
        license = "NONE",

        -- No LICENSE upstream: all rights reserved, so this index has no
        -- right to redistribute it. Absent `mirror` block => architecture A:
        -- straight from git, no CN mirror, and unrecoverable if upstream
        -- disappears. The site labels it as such.
    },
}
