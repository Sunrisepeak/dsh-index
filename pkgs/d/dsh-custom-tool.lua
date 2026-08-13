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
        source = "github",
        origin = "omdsh-dev/dsh-custom-tool",

        versions = {
            ["0.1.0"] = { ref = "b0392bb332cc7bfad65279e160b4b015c6c6d3ca" },
        },
        latest = "0.1.0",

        needs_build = true,
        license = "MIT",

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
