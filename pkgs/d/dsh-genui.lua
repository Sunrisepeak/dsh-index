package = {
    spec = "1",

    name = "dsh-genui",
    description = "GenUI for DeepSeek Harness: interactive UI components rendered inline in assistant replies via the dsh-ui fenc",
    repo = "https://github.com/omdsh-dev/dsh-genui",
    homepage = "https://github.com/omdsh-dev/dsh-genui",
    licenses = {"MIT"},
    authors = {"omdsh-dev"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh", "plugin"},

    dsh = {
        bundle_name = "@omdsh-dev/dsh-genui",
        source = "github",
        origin = "omdsh-dev/dsh-genui",

        versions = {
            ["0.8.0"] = { ref = "57b4338222632f8ea81c2665d44e5f9e80b52686" },
        },
        latest = "0.8.0",

        needs_build = false,
        license = "MIT",

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
