package = {
    spec = "1",

    name = "dsh-douyin",
    description = "DSH WebUI 侧栏短视频插件：原生播放器、系列导航、直链解析与精确历史回放",
    repo = "https://github.com/AnacondaKC/dsh-douyin",
    homepage = "https://github.com/AnacondaKC/dsh-douyin",
    licenses = {"BSD-3-Clause"},
    authors = {"AnacondaKC"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh", "plugin"},

    dsh = {
        bundle_name = "dsh-douyin",
        source = "github",
        origin = "AnacondaKC/dsh-douyin",

        versions = {
            ["0.2.0"] = { ref = "2f28338b29503f20d159b1f0123a985530134b6a" },
        },
        latest = "0.2.0",

        needs_build = false,
        license = "BSD-3-Clause",

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
