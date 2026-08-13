package = {
    spec = "1",

    name = "dsh-all-search",
    description = "dsh search: AnySearch web search provider for DeepSeek Harness (ctx.web)",
    repo = "https://github.com/RealAlexandreAI/dsh-all-search",
    homepage = "https://github.com/RealAlexandreAI/dsh-all-search",
    licenses = {"MIT"},
    authors = {"RealAlexandreAI"},

    status = "dev",
    categories = {"dsh-plugin", "tools", "provider"},
    keywords = {"dsh", "all", "search"},

    dsh = {
        bundle_name = "dsh-all-search",
        source = "github",
        origin = "RealAlexandreAI/dsh-all-search",

        versions = {
            ["0.1.0"] = { ref = "2caa5a336e45d5d9033b7607ce6ae92a94064e6a" },
        },
        latest = "0.1.0",

        needs_build = false,
        license = "MIT",

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
