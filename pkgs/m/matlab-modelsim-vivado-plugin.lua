package = {
    spec = "1",

    name = "matlab-modelsim-vivado-plugin",
    description = "DeepSeek Harness plugin: MATLAB + ModelSim + Vivado full-flow tools for digital communication IC design tasks ",
    repo = "https://github.com/sjscy05/matlab-modelsim-vivado-plugin",
    homepage = "https://github.com/sjscy05/matlab-modelsim-vivado-plugin",
    licenses = {"MIT"},
    authors = {"sjscy05"},

    status = "dev",
    categories = {"dsh-plugin", "provider"},
    keywords = {"dsh", "cordis", "digital-communication", "eda", "fpga", "ic-design", "matlab", "modelsim", "verilog"},

    dsh = {
        bundle_name = "mmv-dspic",

        versions = {
            ["0.1.0"] = { commit = "3105101f317190e2cb0928d8efc1a1abcf7a234b" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
