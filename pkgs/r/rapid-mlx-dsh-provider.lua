package = {
    spec = "1",

    name = "rapid-mlx-dsh-provider",
    description = "Native Rapid-MLX provider for DeepSeek Harness (dsh) — dsh reads model facts from the server instead of your settings.yaml.",
    repo = "https://github.com/raullenchai/rapid-mlx-dsh-provider",
    homepage = "https://github.com/raullenchai/rapid-mlx-dsh-provider",
    licenses = {"Apache-2.0"},
    authors = {"raullenchai"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "headless",

        bundle_name = "@rapid-mlx/dsh-provider",

        versions = {
            ["0.0.0-local"] = { commit = "b14ada226041d98f130e0cb8469391d5b42d612d" },
        },
        latest = "0.0.0-local",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
