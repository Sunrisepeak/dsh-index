---
name: pr-workflow
description: Use for ALL changes — every modification to pkgs/, template.lua, pkgindex-build.lua, tools/, or tests/ MUST go through a PR with CI verification before merging. No direct pushes to main. Covers branch creation, PR submission, CI monitoring, and merge rules.
---

# PR 工作流规范（dsh-index）

## 核心原则

**所有变更必须通过 PR + CI 验证后才能合并到 main。禁止直接 push 到 main。**

无论是新增插件、sha 跟进、模板修改、工具脚本还是 skill 文件，没有例外。

## 为什么

- main 是 xlings 用户直接拉取的包索引，直接 push 的错误会立即影响所有用户
- CI 包含**构建沙箱回归门**——这是本仓库唯一能挡住"索引静默丢掉全部 xpm 段"
  那类事故的检查，跳过 CI 就等于跳过它
- 一个坏的 Lua 语法就能让所有用户安装失败

## 标准流程

### 1. 创建分支

```bash
git fetch origin main
git checkout -b <type>/<scope> origin/main
```

分支命名：

- `feat/<plugin-name>` — 新增插件
- `feat/<plugin-name>-<version>` — 版本/sha 跟进
- `fix/<plugin-name>-<description>` — 修复
- `feat/template-<name>` — 模板/构建器变更（**高风险，见下**）
- `chore/discover-<date>` — 自动发现产出的批量 PR

### 2. 提交变更

```bash
git add <specific-files>
git commit -m "<type>(<scope>): <description>"
```

commit 规范：

- `feat(pkg): add dsh-tool-csv 0.0.1`
- `feat(pkg): bump dsh-cc-tui to 0.1.2`
- `fix(template): assert profile manifest in installed()`
- `fix(build): feature-detect cprintf for the libxpkg sandbox`

**不要 `git add .`**，只添加相关文件。

⚠️ **别把构建产物提交进去**：跑过 `tests/libxpkg_sandbox_harness.lua` 之后，
`pkgs/**` 里会被追加模板内容。提交前务必：

```bash
git status --short pkgs/ && git checkout -- pkgs/
```

### 3. 推送并创建 PR

```bash
git push -u origin <branch>
gh pr create --title "<commit-style title>" --body "..." --base main
```

PR body 必须包含 **Summary**（改了什么、为什么）和 **Test plan**
（见 `xpkg-creater` skill 的 `references/testing-and-acceptance.md` §E）。

### 4. 等待 CI

```bash
gh pr checks <pr-number>
```

必须全绿。CI 包含：

- `build-sanity` — **构建沙箱回归门**（libxpkg plain-Lua，最关键的一条）
- `static-and-isolation` — 描述符 schema + 隔离合规
- `index-registration` — 包索引注册
- `lifecycle-sample` — 抽样真装真卸

### 5. CI 失败处理

1. 读失败 job 的日志
2. 分析根因并修复
3. push 新 commit（不要 force push）
4. 等新一轮 CI
5. 重复直到全绿

### 6. 合并

```bash
gh pr merge <pr-number> --squash
```

## 变更风险分级

| 改什么 | 影响面 | 额外要求 |
|---|---|---|
| 单个 `pkgs/**/*.lua` | 1 个包 | 常规流程 |
| `tools/sync.py` | 未来所有自动 PR | 附一次 dry-run 的 diff |
| **`template.lua`** | **全仓所有包** | 必须附至少 2 个包（一个 github 源、一个 npm 源）的真装真卸证据 |
| **`pkgindex-build.lua`** | **整个索引能否构建** | 必须附 `libxpkg_sandbox_harness.lua` 输出 |

后两行不是形式主义：模板和构建器是这个仓库把 169 个包收敛成一份实现的代价——
收益是改一处全体跟上，代价是错一处全体挂掉。

## 禁止事项

| 操作 | 为什么禁止 |
|---|---|
| `git push origin main` | 绕过 CI，尤其绕过构建沙箱回归门 |
| CI 未通过就 `gh pr merge` | 引入未验证的变更 |
| 一个 PR 混合不相关变更 | 难 review、难 revert |
| 同一个 PR 里既改模板又加包 | 出问题时分不清是模板坏了还是包写错了 |
| force push 到已有 review 的 PR | 丢失 review 上下文 |
| 提交被 harness 追加过模板的 `pkgs/**` | 索引会被构建两次，产出重复 hook |

## 多个变更的处理

拆成多个 PR，各自独立基于最新 main、独立过 CI、独立合并：

```
feat/dsh-tool-csv        → PR #1: 新增插件
feat/template-profile    → PR #2: 模板支持 DSH_PROFILE
chore/discover-20260813  → PR #3: 自动发现批量跟进
```

## 自动发现产出的 PR

`discover.yml` 开的 PR 同样走这条流程，但额外要求：

- 一次 PR 只带一类变更（新增 / 版本跟进 / 状态变更），不混合
- 描述里带 `catalog.json` 的 diff 摘要
- **已收录的 sha 在上游消失（force push / 删库）时必须报警，不能静默跟进**——
  这类 PR 需要人工判断，不走自动合并
