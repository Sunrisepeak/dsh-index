package = {
    spec = "1",

    name = "dsh-chat-import",
    description = "从Claude Code导入历史消息，并在DSH中继续对话",
    repo = "https://github.com/Nwflower/dsh-chat-import",
    homepage = "https://github.com/Nwflower/dsh-chat-import",
    licenses = {"MIT"},
    authors = {"Nwflower"},

    status = "dev",
    categories = {"dsh-plugin", "workflow", "session"},
    keywords = {"dsh", "agent", "ai-agents", "automation", "chatgpt", "claude-code", "codex", "cursor", "developer-tools"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-chat-import",

        versions = {
            ["0.18.3"] = { commit = "2943520642a5b33e80c1555241f3ee2e727e1a66" },
            ["0.18.2"] = { commit = "1268959d2097be6851679ee90a537eea6f1ea539" },
            ["0.18.0"] = { commit = "2640642130328ed40bd2e14c9f213c1a610a777e" },
            ["0.17.0"] = { commit = "205d3bb75bbc8a06b6e1a3939933f85cedc04f97" },
            ["0.11.5"] = { commit = "0fadc1f627860d16b275629d51cd9a05b4cdcdae" },
            ["0.11.3"] = { commit = "1e7a2906bf4094d1af43edbe1a6878c44af78442" },
            ["0.11.2"] = { commit = "f5c7f831322790b168b2df83bfcdd191e7763584" },
            ["0.11.1"] = { commit = "f86ae86527db781ad7f7883070743b01fee9a586" },
            ["0.11.0"] = { commit = "cb942b3e57f36e8394f841899dc9e690180624c6" },
            ["0.10.1"] = { commit = "9f53c242ab2e10377ca0e82a2aa5e0c5af1edefb" },
            ["0.9.1"] = { commit = "bc66a1a9060033071ffe9af7c3f241c467a24785" },
            ["0.9.0"] = { commit = "0b4727ad67055069914beab8ce2df09e2cf3ac2e" },
            ["0.8.3"] = { commit = "686325113117873c00ca74c476f18874b2876796" },
            ["0.8.2"] = { commit = "73ea0122b533e43adb17e5b18f52025751826b99" },
            ["0.8.1"] = { commit = "c99aafd6108227ce1cac9906889750633a0a0ebb" },
            ["0.8.0"] = { commit = "0b758424f2cf0f0ed7c80e7e9482f0f813d92c89" },
            ["0.7.0"] = { commit = "a6c5410e45beb055e232edcf25db29f2721035c6" },
            ["0.6.2"] = { commit = "2a29395619ef89fe191bfc04d29b3140c820402a" },
            ["0.6.1"] = { commit = "22b56ef3d0fc91871446ae130884bcfb8eb08fdb" },
            ["0.6.0"] = { commit = "8ab5fb73b15c218eada298a6be8b50876836b23e" },
            ["0.5.1"] = { commit = "cd476356bcc6e4192aed8bec6211bd68a529e061" },
            ["0.4.0"] = { commit = "36a4ea2aa1dccf21db151aeba87f0a508a28c973" },
            ["0.3.1"] = { commit = "eea0b4f937d92d51683620cacedac4f112000adb" },
            ["0.2.0"] = { commit = "716295709890944639e0654a7476fe572ddabf50" },
            ["0.1.1"] = { commit = "c6913244337f9ed70e8fea2a83622ac8550ea1ee" },
        },
        latest = "0.18.3",

        needs_build = false,

        -- Published by tools/mirror.py to GitHub and GitCode, verified
        -- three ways: local build, GLOBAL and CN all hash the same.
        mirror = {
            ["0.2.0"] = {
                tarball = "dsh-chat-import-0.2.0.tgz",
                sha256  = "79d342e7a5dbf7cafbe248b21079921ac81fe1e372940c6bd07fd5ab5bff78a2",
                cn      = true,
            },
            ["0.1.1"] = {
                tarball = "dsh-chat-import-0.1.1.tgz",
                sha256  = "6690ee9c24336aa64b6f85b4eb9dfd03728232b41561505c4eb7e7f28f0aeb41",
                cn      = true,
            },
        },
    },
}
