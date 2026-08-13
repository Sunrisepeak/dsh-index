package = {
    spec = "1",

    name = "dsh-fun-typewriter",
    description = "DSH Typewriter: WebAudio typing ambience with a plugin-owned settings API and zero audio assets",
    repo = "https://github.com/omdsh-dev/dsh-fun-typewriter",
    homepage = "https://github.com/omdsh-dev/dsh-fun-typewriter",
    licenses = {"BSD-3-Clause"},
    authors = {"omdsh-dev"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh", "plugin"},

    dsh = {
        bundle_name = "@deepseek-ai/dsh-fun-typewriter",
        source = "github",
        origin = "omdsh-dev/dsh-fun-typewriter",

        versions = {
            ["0.0.1-rc.3"] = { ref = "2e971165541117aab8553729605c0fde4833f75b" },
        },
        latest = "0.0.1-rc.3",

        needs_build = false,
        license = "BSD-3-Clause",

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
