package = {
    spec = "1",

    name = "dsh-better-browser",
    description = "DSH 真实浏览器插件：通过 Kimi WebBridge 让 Agent 操作用户已登录的浏览器，并提供 13 个 webbridge_* 工具。 / Let DSH Agents use your signed-in",
    repo = "https://github.com/titanwings/dsh-better-browser",
    homepage = "https://github.com/titanwings/dsh-better-browser",
    licenses = {"BSD-3-Clause"},
    authors = {"titanwings"},

    status = "dev",
    categories = {"dsh-plugin", "workflow", "tools"},
    keywords = {"dsh", "automation", "browser", "kimi-webbridge", "tool"},

    dsh = {
        bundle_name = "@dsh-external/dsh-better-browser",

        versions = {
            ["0.3.6"] = { commit = "506493224a21510c3f9cc7329a17e84af20879dc" },
        },
        latest = "0.3.6",

        needs_build = false,

        -- Published by tools/mirror.py to GitHub and GitCode, verified
        -- three ways: local build, GLOBAL and CN all hash the same.
        mirror = {
            ["0.3.6"] = {
                tarball = "dsh-better-browser-0.3.6.tgz",
                sha256  = "035080c25a50b698227882cbb66e7ecd5b8c1fd0473f34c41b2e0a399e2ad0d2",
                cn      = true,
            },
        },
    },
}
