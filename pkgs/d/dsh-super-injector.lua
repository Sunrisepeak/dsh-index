package = {
    spec = "1",

    name = "dsh-super-injector",
    description = "dsh plugin from yjh051108/dsh-super-injector",
    repo = "https://github.com/yjh051108/dsh-super-injector",
    homepage = "https://github.com/yjh051108/dsh-super-injector",
    authors = {"yjh051108"},

    status = "dev",
    categories = {"dsh-plugin", "uncategorized"},
    keywords = {"dsh", "super", "injector"},

    dsh = {
        bundle_name = "@dsh-external/dsh-super-injector",

        versions = {
            ["0.2.5"] = { commit = "d8986d6f482efee8714bdf80d106c91407b24c56" },
        },
        latest = "0.2.5",

        needs_build = false,

        -- Upstream ships no redistributable license, so this index has
        -- no right to mirror it: no `mirror` block, installs straight
        -- from git, and it cannot be recovered if upstream disappears.
    },
}
