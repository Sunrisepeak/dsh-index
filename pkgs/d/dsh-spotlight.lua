package = {
    spec = "1",

    name = "dsh-spotlight",
    description = "Keyboard-first command palette for DeepSeek Harness Web",
    repo = "https://github.com/0xsline/dsh-spotlight",
    homepage = "https://github.com/0xsline/dsh-spotlight",
    licenses = {"BSD-3-Clause"},
    authors = {"0xsline"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh", "plugin"},

    dsh = {
        bundle_name = "@dsh-external/dsh-spotlight",
        source = "github",
        origin = "0xsline/dsh-spotlight",

        versions = {
            ["0.0.1"] = { ref = "0b821fa73cd61c42c9fd41a2d92378a7e14d605b" },
        },
        latest = "0.0.1",

        needs_build = true,
        license = "BSD-3-Clause",

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
