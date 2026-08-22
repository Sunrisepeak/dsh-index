package = {
    spec = "1",

    name = "dsh-context",
    description = "A DeepSeek Harness plugin for  Context insight dashboard — showing what the model's context window is made of and how it evolves.",
    repo = "https://github.com/bowenliang123/dsh-context",
    homepage = "https://github.com/bowenliang123/dsh-context",
    licenses = {"Apache-2.0"},
    authors = {"bowenliang123"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-context",

        versions = {
            ["0.23.0"] = { commit = "641322a351f837a8bff985ead4a46ad22f750c06" },
            ["0.19.2"] = { commit = "85076ae10c8872b2a6c320062379143c8741079d" },
            ["0.17.0"] = { commit = "19731afd862f0281ce5999c9663f70b72f4313fe" },
            ["0.13.0"] = { commit = "85d7258c0802223ed6b2d4f136bf1ad36169926c" },
            ["0.12.0"] = { commit = "462ac6333c9a6e905695dd010fc95c1f68bdd97d" },
            ["0.10.3"] = { commit = "ec108bb7a705c09ab2113b169c837d4bce5d5da4" },
            ["0.9.0"] = { commit = "aca38b24d714106f7256280dc8f9c9ec5b8e4552" },
            ["0.7.3"] = { commit = "3951da0f42d03f431dc9309d01bba2fd4f4f1d75" },
        },
        latest = "0.23.0",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
