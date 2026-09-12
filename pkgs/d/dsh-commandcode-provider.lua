package = {
    spec = "1",

    name = "dsh-commandcode-provider",
    description = "Unofficial DeepSeek Harness LLM provider plugin for Command Code: live model catalog, reasoning-effort support, Models-page card. Ported from pi-commandcode-provider (MIT).",
    repo = "https://github.com/Mars-Sea/dsh-commandcode-provider",
    homepage = "https://github.com/Mars-Sea/dsh-commandcode-provider",
    authors = {"Mars-Sea"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@mars-sea/dsh-commandcode-provider",

        versions = {
            ["0.2.1"] = { commit = "1394871cacb5d40df32c7816c04bab80c4feb51b" },
        },
        latest = "0.2.1",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
