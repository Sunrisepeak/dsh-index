package = {
    spec = "1",

    name = "dsh-tool-encoding",
    description = "DSH 编码/哈希工具插件：base64/base64url/url/hex 编解码、md5/sha1/sha256/sha512 哈希、UUID 生成，零依赖",
    repo = "https://github.com/omdsh-dev/dsh-tool-encoding",
    homepage = "https://github.com/omdsh-dev/dsh-tool-encoding",
    licenses = {"MIT"},
    authors = {"omdsh-dev"},

    status = "dev",
    categories = {"dsh-plugin", "tools"},
    keywords = {"dsh", "base64", "encoding", "hash"},

    dsh = {
        bundle_name = "@deepseek-ai/dsh-tool-encoding",

        versions = {
            ["0.0.1"] = { commit = "4a137a9b793c82652e33fb9bfea7fcefb91a7cb4" },
        },
        latest = "0.0.1",

        needs_build = false,

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
