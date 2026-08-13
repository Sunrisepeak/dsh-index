package = {
    spec = "1",

    name = "dsh-toolkit",
    description = "DSH 零依赖工具包 collection —— time / encoding / json / calculator / csv / regex / markdown / diff / stat / schema 十",
    repo = "https://github.com/omdsh-dev/dsh-toolkit",
    homepage = "https://github.com/omdsh-dev/dsh-toolkit",
    licenses = {"MIT"},
    authors = {"omdsh-dev"},

    status = "dev",
    categories = {"dsh-plugin", "tools"},
    keywords = {"dsh", "collection", "toolkit", "zero-dependency"},

    dsh = {
        bundle_name = "@deepseek-ai/dsh-toolkit",

        versions = {
            ["0.0.1"] = { commit = "35a713fd53e07fbe46e4f14e65498520e5a73981" },
        },
        latest = "0.0.1",

        needs_build = false,

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
