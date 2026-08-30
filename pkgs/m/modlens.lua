package = {
    spec = "1",

    name = "modlens",
    description = "CLI toolkit for AI agents — converts images into structured JSON evidence (OCR, layout, semantics), bridging t",
    repo = "https://github.com/liustack/modlens",
    homepage = "https://github.com/liustack/modlens",
    licenses = {"MIT"},
    authors = {"liustack"},

    status = "dev",
    categories = {"dsh-plugin", "vision", "skills"},
    keywords = {"dsh", "agent-skills", "agentic-workflow", "claude-code", "claude-skills", "codex", "cordis", "glm", "harness-engineering"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@liustack/modlens",

        versions = {
            ["3.25.3"] = { commit = "4f724704eed025c77ad2c6d40fabe17cb3a8d714" },
            ["3.25.2"] = { commit = "147356e6dde04c69a6a3eeb95d1e21ffeb057d6c" },
            ["3.25.1"] = { commit = "47c6783a051f76946bd2fb0f30a2d330cce5f3f3" },
            ["3.25.0"] = { commit = "00f3658c30655314b013edbb5687c4ec5f5dab27" },
            ["3.24.2"] = { commit = "0cd2b6013815d4e8c891943120a3b947580e3275" },
            ["3.24.1"] = { commit = "043b7d2394e87ba33fb715fda032decb2155087c" },
            ["3.24.0"] = { commit = "99eb92f0340c12cfbee84d1d97dbb7c5cc403d9c" },
            ["3.23.1"] = { commit = "4f14df973f72964d3528a96e618f10196440e58f" },
            ["3.22.1"] = { commit = "aaeb5664290f8ffa701261bce3284edbaa21a5d8" },
            ["3.22.0"] = { commit = "cb481974e1154afffd3835689284d3d28e57c7e1" },
            ["3.21.1"] = { commit = "6e1fb0666a11c8c6c04b0895b0fc3f0d10ba0c96" },
            ["3.18.3"] = { commit = "3d2469a519da858672be606c7731249295f1afe0" },
            ["3.18.1"] = { commit = "2b71582435ff34a548efbefb74178ed133659ccb" },
            ["3.17.0"] = { commit = "7705546778c950c108ca60ec711f4023a7e7415b" },
            ["3.16.6"] = { commit = "28181920f6b064e33c6b235221e1a3a5d360a897" },
            ["3.11.0"] = { commit = "5faff399c64fb5979e60c0a52e1e212dbdab1a31" },
            ["3.9.1"] = { commit = "56045a985692ec5663e5757361e6c180648e6f04" },
        },
        latest = "3.25.3",

        needs_build = false,

        -- Published by tools/mirror.py to GitHub and GitCode, verified
        -- three ways: local build, GLOBAL and CN all hash the same.
        mirror = {
            ["3.11.0"] = {
                tarball = "modlens-3.11.0.tgz",
                sha256  = "07aad008656d591934970a48162e65b4ebf39aee1c8557f42e6a0f8e2bd59bb1",
                cn      = true,
            },
            ["3.9.1"] = {
                tarball = "modlens-3.9.1.tgz",
                sha256  = "76e8845e98c55769251988c3c3147aea81e7b7021e41bb96611446fbdfe30746",
                cn      = true,
            },
        },
    },
}
