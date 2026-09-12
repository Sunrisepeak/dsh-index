package = {
    spec = "1",

    name = "picturereader",
    description = "DSH plugin: pixel-to-text image reading for text-only models. image_scan/image_ocr/image_sample tools + image-reading skill (34-image trained methodology). Pure local, optional PaddleOCR.",
    repo = "https://github.com/jing-hy/picturereader",
    homepage = "https://github.com/jing-hy/picturereader",
    licenses = {"MIT"},
    authors = {"jing-hy"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "picturereader",

        versions = {
            ["1.0.2"] = { commit = "a162bc6aee2f2f818d09ae47dce87644e5dacd71" },
        },
        latest = "1.0.2",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
