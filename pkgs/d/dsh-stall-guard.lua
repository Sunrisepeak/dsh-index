package = {
    spec = "1",

    name = "dsh-stall-guard",
    description = "DeepSeek Harness watchdog plugin: detects truly stalled agent turns (never killing in-progress tasks — in-flight operations are exempt), nudges/terminates only on real silence, records every event to JSONL with a loopback status route",
    repo = "https://github.com/akira399/dsh-stall-guard",
    homepage = "https://github.com/akira399/dsh-stall-guard",
    licenses = {"MIT"},
    authors = {"akira399"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-stall-guard",

        versions = {
            ["1.3.0"] = { commit = "db5b2147ccd60c0a0f9305f12402fb84491e919d" },
        },
        latest = "1.3.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
