package = {
    spec = "1",

    name = "dsh-custom-tool",
    description = "Create and manage sandboxed JavaScript tools for DeepSeek Harness with a Monaco editor and model-driven tool l",
    repo = "https://github.com/omdsh-dev/dsh-custom-tool",
    homepage = "https://github.com/omdsh-dev/dsh-custom-tool",
    licenses = {"MIT"},
    authors = {"omdsh-dev"},

    status = "dev",
    categories = {"dsh-plugin", "tools", "sandbox"},
    keywords = {"dsh", "custom", "tool"},

    dsh = {
        bundle_name = "dsh-custom-tool",

        versions = {
            ["0.1.1"] = { commit = "b0392bb332cc7bfad65279e160b4b015c6c6d3ca" },
        },
        latest = "0.1.1",

        needs_build = false,

        mirror = {
            ["0.1.1"] = {
                tarball = "dsh-custom-tool-0.1.1.tgz",
                sha256  = "7b91488ac7ada4a8506370cb6c91ba8c8a09bc5d94a8c32cf07a14518e7da770",
                cn      = true,
            },
        },
    },
}
