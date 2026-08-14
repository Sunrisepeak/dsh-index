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
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-openapi",

        versions = {
            ["0.1.0"] = { commit = "fb854355b89e495ded090b9e2eb94c33430d2366" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- Published by tools/mirror.py to GitHub and GitCode, verified
        -- three ways: local build, GLOBAL and CN all hash the same.
        mirror = {
            ["0.1.0"] = {
                tarball = "dsh-openapi-0.1.0.tgz",
                sha256  = "787616eca4538adc8e1805ada8a1d6049a7c6625d7bd47a537071a2ba2530edc",
                cn      = true,
            },
        },
    },
}
