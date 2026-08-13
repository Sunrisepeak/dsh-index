package = {
    spec = "1",

    name = "dsh-openapi",
    description = "Safe OpenAPI 3.x discovery and API calling tools for DeepSeek Harness",
    repo = "https://github.com/Degurechaff57/dsh-openapi",
    homepage = "https://github.com/Degurechaff57/dsh-openapi",
    licenses = {"MIT"},
    authors = {"Degurechaff57"},

    status = "dev",
    categories = {"dsh-plugin", "provider"},
    keywords = {"dsh", "ai-agent", "openapi", "swagger"},

    dsh = {
        bundle_name = "dsh-openapi",
        source = "github",
        origin = "Degurechaff57/dsh-openapi",

        versions = {
            ["0.1.0"] = { ref = "fb854355b89e495ded090b9e2eb94c33430d2366" },
        },
        latest = "0.1.0",

        needs_build = false,
        license = "MIT",

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
