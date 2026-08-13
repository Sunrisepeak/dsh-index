package = {
    spec = "1",

    name = "dsh-deeplink",
    description = "DSH WebUI 深链插件：?session=/?workspace= 直接打开指定项目对话",
    repo = "https://github.com/qyw233/dsh-deeplink",
    homepage = "https://github.com/qyw233/dsh-deeplink",
    licenses = {"MIT"},
    authors = {"qyw233"},

    status = "dev",
    categories = {"dsh-plugin", "web-ui", "session"},
    keywords = {"dsh", "deeplink"},

    dsh = {
        bundle_name = "@dsh-community/dsh-deeplink",

        versions = {
            ["0.5.0"] = { commit = "0ec5da351b246dfcbf9a91a3d0c7b7f2699370e6" },
        },
        latest = "0.5.0",

        needs_build = false,

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
