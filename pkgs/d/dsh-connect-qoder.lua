package = {
    spec = "1",

    name = "dsh-connect-qoder",
    description = "Connect Qoder (Lingma CN / international) models to DeepSeek Harness through their PATs, with a multi-account pool, daily check-in, automatic failover, and a read-only credits overview.",
    repo = "https://github.com/dingminhua/dsh-connect-qoder",
    homepage = "https://github.com/dingminhua/dsh-connect-qoder",
    licenses = {"MIT"},
    authors = {"dingminhua"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "desktop",

        bundle_name = "@dmh2002/dsh-connect-qoder",

        versions = {
            ["1.17.0"] = { commit = "51e5305723750e53696ff5f4c68c80d0682f24c8" },
        },
        latest = "1.17.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
