package = {
    spec = "1",

    name = "dsh-deep-research",
    description = "Adaptive deep-research orchestrator plugin for DeepSeek Harness (official workflow engine, cybernetics/informa",
    repo = "https://github.com/omdsh-dev/dsh-deep-research",
    homepage = "https://github.com/omdsh-dev/dsh-deep-research",
    licenses = {"MIT"},
    authors = {"omdsh-dev"},

    status = "dev",
    categories = {"dsh-plugin", "workflow"},
    keywords = {"dsh", "deep", "research"},

    dsh = {
        bundle_name = "@dsh-external/dsh-deep-research",

        versions = {
            ["0.1.0"] = { commit = "c0b329e02cd0195f810a7c3608cb58701a7fe0f1" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- Published by tools/mirror.py to GitHub and GitCode, verified
        -- three ways: local build, GLOBAL and CN all hash the same.
        mirror = {
            ["0.1.0"] = {
                tarball = "dsh-deep-research-0.1.0.tgz",
                sha256  = "24a6676292b0020b3f408538bc1f271c4351ada050a8070a4e0c42e79f333b19",
                cn      = true,
            },
        },
    },
}
