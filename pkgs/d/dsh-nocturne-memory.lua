package = {
    spec = "1",

    name = "dsh-nocturne-memory",
    description = "dsh memory: Nocturne Memory client for DeepSeek Harness",
    repo = "https://github.com/RealAlexandreAI/dsh-nocturne-memory",
    homepage = "https://github.com/RealAlexandreAI/dsh-nocturne-memory",
    licenses = {"MIT"},
    authors = {"RealAlexandreAI"},

    status = "dev",
    categories = {"dsh-plugin", "memory"},
    keywords = {"dsh", "nocturne", "memory"},

    dsh = {
        bundle_name = "dsh-nocturne-memory",
        source = "github",
        origin = "RealAlexandreAI/dsh-nocturne-memory",

        versions = {
            ["0.1.0"] = { ref = "56e8f339a7a5e16fb9712cb945a0b5b45b6cadf3" },
        },
        latest = "0.1.0",

        needs_build = false,
        license = "MIT",

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
