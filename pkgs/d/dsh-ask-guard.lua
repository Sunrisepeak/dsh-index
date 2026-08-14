package = {
    spec = "1",

    name = "dsh-ask-guard",
    description = "Timeout guard for ask_user_question: a lost or unanswered question resolves as ASK_TIMEOUT instead of hanging the turn forever",
    repo = "https://github.com/Q1hangL/dsh-ask-guard",
    homepage = "https://github.com/Q1hangL/dsh-ask-guard",
    licenses = {"MIT"},
    authors = {"Q1hangL"},

    status = "dev",
    categories = {"dsh-plugin", "tools"},
    keywords = {"dsh", "ask-user-question", "timeout", "ask-guard"},

    dsh = {
        kind = "plugin",
        -- This plugin's own README documents installing into the web profile.
        profile = "web",

        bundle_name = "dsh-ask-guard",

        versions = {
            ["0.1.0"] = { commit = "a45f230320edd3b2ca20fd4f4d0ccdf9ff186114" },
        },
        latest = "0.1.0",

        needs_build = false,
    },
}
