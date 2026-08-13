package = {
    spec = "1",

    name = "dsh-prompt-studio",
    description = "DSH plugin: edit user and built-in system-prompt sections with live preview (Prompt Studio)",
    repo = "https://github.com/Moeblack/dsh-prompt-studio",
    homepage = "https://github.com/Moeblack/dsh-prompt-studio",
    licenses = {"BSD-3-Clause"},
    authors = {"Moeblack"},

    status = "dev",
    categories = {"dsh-plugin", "skills"},
    keywords = {"dsh", "prompt", "studio"},

    dsh = {
        bundle_name = "dsh-prompt-studio",
        source = "github",
        origin = "Moeblack/dsh-prompt-studio",

        versions = {
            ["0.4.0"] = { ref = "be5e97d6ea4e882067d9f3a6385f486f7f192e92" },
        },
        latest = "0.4.0",

        needs_build = false,
        license = "BSD-3-Clause",

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
