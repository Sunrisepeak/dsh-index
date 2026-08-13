package = {
    spec = "1",

    name = "7d7d",
    description = "dsh plugin from omdsh-dev/7d7d",
    repo = "https://github.com/omdsh-dev/7d7d",
    homepage = "https://github.com/omdsh-dev/7d7d",
    licenses = {"MIT"},
    authors = {"omdsh-dev"},

    status = "dev",
    categories = {"dsh-plugin", "web-ui"},
    keywords = {"dsh", "mini-games", "react", "typescript"},

    dsh = {
        bundle_name = "@mattheliu/7d7d",
        source = "github",
        origin = "omdsh-dev/7d7d",

        versions = {
            ["0.4.0-rc.1"] = { ref = "80b6ddb779a009d378a1c30c85dfef598f527997" },
        },
        latest = "0.4.0-rc.1",

        needs_build = false,
        license = "MIT",

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
