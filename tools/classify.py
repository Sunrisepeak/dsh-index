"""Derive categories and keywords for a dsh plugin.

There is no category field anywhere in this ecosystem. The two real signals are
the author's own GitHub topics and the plugin's own name -- both author-chosen,
neither invented here. A bundle's cordis.patch.yml was checked as a third
option and rejected: almost every one just inserts the plugin by name, so it
carries no taxonomy.

Anything the rules cannot place stays `uncategorized` rather than being pushed
into a bucket that looks authoritative. That is why the counts on the site add
up to something honest.
"""

from __future__ import annotations

import re

# Topics every plugin carries; they identify the ecosystem, not the plugin.
UNIVERSAL = {"dsh-plugin", "dsh", "deepseek-harness", "deepseek", "plugin",
             "dsh-bundle", "harness", "dsh-external"}

# (category, name pattern, topic hits, description pattern). The description
# is the author's own summary and is often the only discriminating signal --
# most names are just "dsh-<thing>". Patterns are bilingual because most of
# this ecosystem writes Chinese.
RULES = [
    ("tui",       r"(^|-)(tui|terminal|cli)(-|$)",        {"tui", "terminal", "cli"},
                  r"terminal|full-screen|TUI|终端"),
    ("desktop",   r"(^|-)(desktop|electron|macos|tray)",  {"desktop", "electron", "macos", "appkit", "tauri"},
                  r"desktop|macOS|menu ?bar|tray|桌面|托盘"),
    ("web-ui",    r"(^|-)(web|ui|panel|sidebar|theme|css|style|island|sticker|status|emoji|canvas|spotlight|focus|disclosure|drag)",
                  {"ui", "web", "webui", "react", "vue", "css", "frontend", "accessibility"},
                  r"Web ?UI|WebUI|web client|侧栏|界面|视图|面板|前端|样式|主题|拖拽|折叠|表情|命令面板|palette"),
    ("vision",    r"(^|-)(vision|image|ocr|screenshot|multimodal|visual)",
                  {"vision", "ocr", "image", "multimodal", "text-only-llm", "computer-use", "gui-automation"},
                  r"vision|image|OCR|screenshot|视觉|图片|截图|多模态"),
    ("memory",    r"(^|-)(memory|mem|recall|knowledge|rag|context|notebook)",
                  {"memory", "knowledge-graph", "rag", "context"},
                  r"memory|knowledge|recall|记忆|知识|笔记"),
    ("workflow",  r"(^|-)(workflow|plan|orchestr|agent-?teams|subagent|loop|ralph|multi|advisor|sentinel|interconnect)",
                  {"workflow", "automation", "multi-agent", "orchestration", "human-in-the-loop"},
                  r"workflow|orchestrat|multi-agent|subagent|pipeline|wakeup|工作流|编排|多 ?[Aa]gent|自动化"),
    ("skills",    r"(^|-)(skill|prompt|persona|instruction)",
                  {"agent-skills", "skills", "prompt", "persona"},
                  r"skill|prompt|persona|技能|提示词|人设"),
    ("tools",     r"(^|-)(tool|mcp|search|fs|file|bash|shell|exec|browser|web-?craw|interpreter|blame)",
                  {"tool", "agent-tools", "mcp", "browser", "search"},
                  r"tool|MCP|browser|文件|工具|解析器|爬"),
    ("session",   r"(^|-)(session|history|checkpoint|rewind|resume|trace|track|share|sidechain|101|doc)",
                  {"session", "checkpoint", "trace", "diagnostics", "debugging", "statistics"},
                  r"session|conversation|history|share|checkpoint|会话|对话|历史|分享|回放|文档"),
    ("provider",  r"(^|-)(llm|model|provider|openai|codex|claude|gemini|grok|auth|acp)",
                  {"llm", "provider", "claude-code", "codex", "openai", "ai-agent", "coding-agent"},
                  r"model|provider|LLM|API|模型|接入|对接"),
    ("notify",    r"(^|-)(notif|feishu|slack|webhook|bot|remote)",
                  {"notification", "webhook", "bot"},
                  r"notif|webhook|通知|提醒|推送"),
    ("sandbox",   r"(^|-)(sandbox|security|guard|approval|permission|check)",
                  {"sandbox", "security"},
                  r"sandbox|security|permission|approval|沙箱|安全|审批|校验"),
    ("fun",       r"(^|-)(pet|game|gomoku|ads|fun|maid|whale|tavern|qq|douyin|d399|stock)",
                  {"pet", "game", "fun"},
                  r"game|游戏|广告|短视频|娱乐|寂寞|亏钱"),
]


def classify(name: str, topics: list[str], desc: str = "") -> tuple[list[str], list[str]]:
    """Return (categories, keywords). Categories always start with dsh-plugin
    so the namespace stays a usable filter."""
    real = [t for t in topics if t and t not in UNIVERSAL]
    tset = set(real)

    cats = []
    for cat, pattern, hits, dpat in RULES:
        if (re.search(pattern, name)
                or (tset & hits)
                or (desc and re.search(dpat, desc, re.I))):
            cats.append(cat)
    if not cats:
        cats = ["uncategorized"]

    # Keywords: the author's own topics, else tokens from the plugin name --
    # obviously name-derived rather than dressed up as metadata.
    kws = real[:8]
    if not kws:
        kws = [t for t in re.split(r"[-_.]", name) if len(t) > 2 and t not in ("dsh",)][:5]
    return ["dsh-plugin"] + cats[:2], kws


if __name__ == "__main__":
    import collections
    import sys
    topics = {}
    for line in open(sys.argv[1], encoding="utf-8"):
        p = line.rstrip("\n").split("\t")
        topics[p[0]] = p[1].split(",") if len(p) > 1 and p[1] else []
    descs = {}
    if len(sys.argv) > 2:
        import json
        for line in open(sys.argv[2], encoding="utf-8"):
            r = json.loads(line)
            if r.get("bundle"):
                descs[r["repo"]] = r.get("desc") or ""
    counts = collections.Counter()
    for repo, ts in topics.items():
        cats, _ = classify(repo.split("/")[-1].lower().replace("_", "-"), ts,
                           descs.get(repo, ""))
        for c in cats[1:]:
            counts[c] += 1
    total = len(topics)
    unc = counts.get("uncategorized", 0)
    print(f"classified {total - unc}/{total} ({(total-unc)*100//total}%)")
    for c, n in counts.most_common():
        print(f"   {c:<16} {n}")
