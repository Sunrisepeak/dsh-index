package = {
    spec = "1",

    name = "dsh-auto-chess",
    description = "DSH Web里的自走棋插件：人机对战或双AI对弈",
    repo = "https://github.com/omdsh-dev/dsh-auto-chess",
    homepage = "https://github.com/omdsh-dev/dsh-auto-chess",
    licenses = {"MIT"},
    authors = {"omdsh-dev"},

    status = "dev",
    categories = {"dsh-plugin", "uncategorized"},
    keywords = {"dsh", "auto", "chess"},

    dsh = {
        bundle_name = "@deepseek-ai/dsh-auto-chess",
        source = "github",
        origin = "omdsh-dev/dsh-auto-chess",

        versions = {
            ["0.0.1"] = { ref = "cc0728d808cb9c9b563cc6be95e5bf60ae2a5025" },
        },
        latest = "0.0.1",

        needs_build = true,
        license = "MIT",

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
