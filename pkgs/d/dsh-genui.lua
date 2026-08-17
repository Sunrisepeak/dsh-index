package = {
    spec = "1",

    name = "dsh-genui",
    description = "GenUI for DeepSeek Harness: interactive UI components rendered inline in assistant replies via the dsh-ui fenc",
    repo = "https://github.com/omdsh-dev/dsh-genui",
    homepage = "https://github.com/omdsh-dev/dsh-genui",
    licenses = {"MIT"},
    authors = {"omdsh-dev"},

    status = "dev",
    categories = {"dsh-plugin", "uncategorized"},
    keywords = {"dsh", "genui"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@omdsh-dev/dsh-genui",

        versions = {
            ["0.8.6"] = { commit = "2187fa48dfb05126850d3a1516be910718afdc79" },
            ["0.8.5"] = { commit = "fd87f36a897cc25e64a4eba1bb98b1210d005fc9" },
            ["0.8.3"] = { commit = "0e756efb7671e6b8413dde3d8e199c68fa89cbeb" },
            ["0.8.0"] = { commit = "57b4338222632f8ea81c2665d44e5f9e80b52686" },
        },
        latest = "0.8.6",

        needs_build = false,

        -- Published by tools/mirror.py to GitHub and GitCode, verified
        -- three ways: local build, GLOBAL and CN all hash the same.
        mirror = {
            ["0.8.0"] = {
                tarball = "dsh-genui-0.8.0.tgz",
                sha256  = "fa5e5d835340b3e170fc5d788b4bfbbe1bb92ef722b7a4fd3ce7729a61ed33ca",
                cn      = true,
            },
        },
    },
}
