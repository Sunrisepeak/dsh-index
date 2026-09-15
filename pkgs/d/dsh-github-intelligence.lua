package = {
    spec = "1",

    name = "dsh-github-intelligence",
    description = "The most comprehensive developer-intelligence integration for DeepSeek Harness: 196+ read-only tools across 16 developer ecosystems (GitHub, GitLab, Gitee, npm, PyPI, crates.io, Docker Hub, Hugging Face, Hacker News, Stack Overflow, Reddit, dev.to, RubyGems, NuGet, Go, ArXiv) with rate-limit-friendly caching.",
    repo = "https://github.com/zoahdev/dsh-github-intelligence",
    homepage = "https://github.com/zoahdev/dsh-github-intelligence",
    licenses = {"MIT"},
    authors = {"zoahdev"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-github-intelligence",

        versions = {
            ["2.10.0"] = { commit = "7e999c6fce36d0fda71f8fd25b36e829809de426" },
        },
        latest = "2.10.0",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
