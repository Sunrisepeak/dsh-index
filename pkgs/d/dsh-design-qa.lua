package = {
    spec = "1",

    name = "dsh-design-qa",
    description = "Design-fidelity QA for DeepSeek Harness: lend any text-only model an eye, then judge whether the implementation matches the mock. Ships the benchmark behind that judgement — four fixtures, 23 injected defects, and every raw model transcript. Retires itself when DeepSeek ships vision.",
    repo = "https://github.com/sunxin-ai/dsh-design-qa",
    homepage = "https://github.com/sunxin-ai/dsh-design-qa",
    licenses = {"MIT"},
    authors = {"sunxin-ai"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-design-qa",

        versions = {
            ["0.1.4"] = { commit = "a760f72e965e0a650fc03ba5df3802316f28756a" },
        },
        latest = "0.1.4",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
