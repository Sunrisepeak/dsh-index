package = {
    spec = "1",

    name = "dsh-better-browser",
    description = "DSH 真实浏览器插件：通过 Kimi WebBridge 让 Agent 操作用户已登录的浏览器，并提供 13 个 webbridge_* 工具。 / Let DSH Agents use your signed-in",
    repo = "https://github.com/titanwings/dsh-better-browser",
    homepage = "https://github.com/titanwings/dsh-better-browser",
    licenses = {"BSD-3-Clause"},
    authors = {"titanwings"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh", "plugin"},

    dsh = {
        bundle_name = "@dsh-external/dsh-better-browser",
        source = "github",
        origin = "titanwings/dsh-better-browser",

        versions = {
            ["0.3.1"] = { ref = "506493224a21510c3f9cc7329a17e84af20879dc" },
        },
        latest = "0.3.1",

        needs_build = false,
        license = "BSD-3-Clause",

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
