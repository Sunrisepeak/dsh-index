package = {
    spec = "1",

    name = "dsh-cloudflare-browser-run",
    description = "dsh browser-run: CF Browser Run web tools (markdown/screenshot/pdf) for DeepSeek Harness",
    repo = "https://github.com/RealAlexandreAI/dsh-cloudflare-browser-run",
    homepage = "https://github.com/RealAlexandreAI/dsh-cloudflare-browser-run",
    licenses = {"MIT"},
    authors = {"RealAlexandreAI"},

    status = "dev",
    categories = {"dsh-plugin", "vision", "tools"},
    keywords = {"dsh", "cloudflare", "browser", "run"},

    dsh = {
        bundle_name = "dsh-cloudflare-browser-run",

        versions = {
            ["0.1.1"] = { commit = "f85ec677f77665640315d89aebe876b4877995bd" },
        },
        latest = "0.1.1",

        needs_build = false,

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
