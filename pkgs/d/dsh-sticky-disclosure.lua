package = {
    spec = "1",

    name = "dsh-sticky-disclosure",
    description = "DSH Web client plugin: pins off-screen expanded collapsible tags (Think / tool cards) to the top of the conver",
    repo = "https://github.com/Han-1413141/dsh-sticky-disclosure",
    homepage = "https://github.com/Han-1413141/dsh-sticky-disclosure",
    licenses = {"MIT"},
    authors = {"Han-1413141"},

    status = "dev",
    categories = {"dsh-plugin", "web-ui"},
    keywords = {"dsh", "client-plugin"},

    dsh = {
        bundle_name = "dsh-sticky-disclosure",

        versions = {
            ["0.1.0"] = { commit = "8272c4af3fe06170edc8e3554da63879e1ffa0ef" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
