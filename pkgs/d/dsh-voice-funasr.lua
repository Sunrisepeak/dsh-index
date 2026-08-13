package = {
    spec = "1",

    name = "dsh-voice-funasr",
    description = "dsh plugin from omdsh-dev/dsh-voice-funasr",
    repo = "https://github.com/omdsh-dev/dsh-voice-funasr",
    homepage = "https://github.com/omdsh-dev/dsh-voice-funasr",
    licenses = {"MIT"},
    authors = {"omdsh-dev"},

    status = "dev",
    categories = {"dsh-plugin", "fun"},
    keywords = {"dsh", "voice", "funasr"},

    dsh = {
        bundle_name = "dsh-voice-funasr",
        source = "github",
        origin = "omdsh-dev/dsh-voice-funasr",

        versions = {
            ["0.1.2"] = { ref = "2ac730e83730ee7408704b3607eb8f3d96a52050" },
        },
        latest = "0.1.2",

        needs_build = false,
        license = "MIT",

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
