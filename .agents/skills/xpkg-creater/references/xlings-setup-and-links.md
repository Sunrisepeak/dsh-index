# xlings setup & links（dsh-index 版）

## 1) 安装 xlings

> 目标：本地可执行 `xlings --version`。

```bash
# 方式 A：quick_install（GitHub）
export XLINGS_NON_INTERACTIVE=1
curl -fsSL https://raw.githubusercontent.com/openxlings/xlings/main/tools/other/quick_install.sh | bash
```

```bash
# 方式 B：d2learn 安装脚本
export XLINGS_NON_INTERACTIVE=1
curl -fsSL https://d2learn.org/xlings-install.sh | bash
```

## 2) 装齐本仓库需要的运行时

```bash
xlings install dsh -y        # DeepSeek Harness 本体（xim:dsh，2026-08-13 入索引）
xlings install pnpm -y       # dsh plugin 是 pnpm 的薄转发器，绕不开
sudo apt-get install -y lua5.4   # 只为跑构建沙箱回归门
```

验证：

```bash
dsh --version        # 期望 0.1.0-rc.6 或更新
pnpm --version
lua5.4 -v
```

> **aarch64 注意**：`xim:pnpm` 在 Linux/Windows 上只有 x86_64 资产
> （`archs = {"x86_64"}`），所以 aarch64 上目前装不了插件。
> 这是已知缺口，不要在描述符里假装支持——等 `xim:pnpm` 补 arm64 后自动解决。

## 3) 使用本索引

```bash
# 注册索引仓库（命名空间固定为 dsh）
xim --add-indexrepo dsh:https://github.com/Sunrisepeak/dsh-index.git

# 安装插件
xlings install dsh:<plugin>
xlings install dsh:<plugin>@<version>

# 装进指定 profile（profile 是本生态唯一的并存/切换轴）
DSH_PROFILE=exp xlings install dsh:<plugin>

# 需要执行上游 prepare 构建脚本的插件，必须显式授权
DSH_ALLOW_BUILDS=1 xlings install dsh:<plugin>
```

## 4) 核心链接

### 本仓库

- 索引仓库：<https://github.com/Sunrisepeak/dsh-index>
- 设计方案：`.agents/docs/2026-08-13-dsh-plugin-index-design.md`
- 包索引网站：<https://sunrisepeak.github.io/dsh-index>

### 上游 dsh

- DeepSeek Harness：<https://github.com/deepseek-ai/deepseek-harness>
- 插件打包与安装（bundle / profile 权威文档）：
  `docs/user/develop/basic/publish.md`
- **profile bundle 决策记录**：
  `.agents/notes/implemented/architecture/2026-08-05-profile-plugin-bundles.md`
- **repository-plugin 删除记录**（2026-08-09，确立"唯一官方分发通道"）：
  `.agents/notes/implemented/simplification/2026-08-09-remove-repository-plugin.md`
- npm 包（唯一发布渠道，无 GitHub release / 无 git tag）：
  <https://www.npmjs.com/package/@deepseek-ai/dsh>
- 插件发现入口（上游 README 指定）：<https://github.com/topics/dsh-plugin>

### 生态

- 兼容性情报（四维矩阵 + 运行级实测，本索引**引用**不重算）：
  <https://github.com/AdamPlatin123/awesome-dsh-plugins>

### xlings

- xlings 仓库：<https://github.com/openxlings/xlings>
- 官方包索引：<https://github.com/openxlings/xim-pkgindex>（`xim:dsh` 在 `pkgs/d/dsh.lua`）
- 索引模板机制参照：<https://github.com/d2learn/xim-pkgindex-d2x>
  （`pkgindex-build.lua` + `template.lua` + `tests/libxpkg_sandbox_harness.lua`）
- 网站生成器：<https://github.com/openxlings/xpkgindex>
- 文档：<https://xlings.d2learn.org> ｜ 论坛：<https://forum.d2learn.org>

## 5) 常用排查

```bash
# 装了什么、装进哪个 profile
jq '.dependencies, .dsh.profile.bundles' ~/.dsh/profiles/<p>/package.json

# 配置层到底组合出了什么（唯一的功能性证据）
dsh --profile <p> --dump-config | grep "^# == "

# xim 侧的 payload（本仓库的包 payload 是空的，这是设计如此）
ls ~/.xlings/data/xpkgs/dsh-x-<plugin>/<version>/

# 同名同版本已装在别的 namespace → install hook 被整个跳过且照样报成功
rm -rf ~/.xlings/data/xpkgs/{dsh,local}-x-<plugin>/<version>
```
