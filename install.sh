#!/usr/bin/env bash
# Ghostty 一键配置：Paper A11y 主题 + Geist Mono 字体
set -euo pipefail

THEME_DIR="$HOME/.config/ghostty/themes"
CONF_DIR="$HOME/Library/Application Support/com.mitchellh.ghostty"
CONF="$CONF_DIR/config"
TS=$(date +%Y%m%d%H%M%S)

mkdir -p "$THEME_DIR" "$CONF_DIR"

# 已有配置先备份
[ -f "$CONF" ] && cp "$CONF" "$CONF.bak.$TS" && echo "已备份旧配置 -> $CONF.bak.$TS"

# ---- 主题 ----
cat > "$THEME_DIR/paper-a11y" <<'THEME'
# Paper A11y — 浅色、WCAG AA 友好的 Ghostty 主题
# 所有 16 色在背景 #FBFAF7 上对比度 ≥ 4.5:1
background = #FBFAF7
foreground = #1C1E21
cursor-color = #0E6B5C
cursor-text = #FFFFFF
selection-background = #CFE3DE
selection-foreground = #1C1E21

# 普通色
palette = 0=#1C1E21
palette = 1=#B42318
palette = 2=#1A7F37
palette = 3=#8A5A00
palette = 4=#1F5FBF
palette = 5=#8E3FA0
palette = 6=#0E6B5C
palette = 7=#5A5F66
# 亮色（浅底上加深以强调）
palette = 8=#4A4E55
palette = 9=#9A1B12
palette = 10=#146B2D
palette = 11=#734A00
palette = 12=#174D9E
palette = 13=#76318A
palette = 14=#0A5246
palette = 15=#3A3D42
THEME

cat > "$THEME_DIR/paper-a11y-dark" <<'THEME'
# Paper A11y Dark — 与 paper-a11y 同风格的深色主题
# 所有 16 色在背景 #17191C 上对比度 ≥ 4.5:1
background = #17191C
foreground = #E6E4DF
cursor-color = #4FBFAB
cursor-text = #17191C
selection-background = #2F4A45
selection-foreground = #E6E4DF

# 普通色
palette = 0=#7E8187
palette = 1=#F2706A
palette = 2=#5CBF74
palette = 3=#D9A441
palette = 4=#6FA3F0
palette = 5=#C987D9
palette = 6=#4FBFAB
palette = 7=#B8B5AE
# 亮色
palette = 8=#8A8D93
palette = 9=#FF9A93
palette = 10=#86D99A
palette = 11=#F0C46E
palette = 12=#9CC2FA
palette = 13=#DEAEEA
palette = 14=#82D9C9
palette = 15=#F5F3EE
THEME

# ---- 主配置 ----
cat > "$CONF" <<'CONF'
# ---- 配色 ----
theme = light:paper-a11y,dark:paper-a11y-dark
# 兜底：程序输出的任意颜色若对比度不足，Ghostty 会自动调整到 ≥ 4.5:1
minimum-contrast = 4.5

# ---- 字体 ----
font-family = Geist Mono
# 中文回退到苹方
font-family = PingFang SC
font-size = 14
# 行距加大 15%，长时间阅读更轻松
adjust-cell-height = 15%
CONF

# ---- 字体 Geist Mono ----
if ls "$HOME/Library/Fonts"/GeistMono-* >/dev/null 2>&1; then
  echo "Geist Mono 已安装"
elif command -v brew >/dev/null 2>&1; then
  brew install --cask font-geist-mono
else
  echo "未检测到 Homebrew，直接从 GitHub 下载 Geist Mono..."
  TMP=$(mktemp -d)
  URL=$(curl -fsSL https://api.github.com/repos/vercel/geist-font/releases/latest \
        | grep -o '"browser_download_url": *"[^"]*\.zip"' | head -1 | cut -d'"' -f4)
  curl -fsSL "$URL" -o "$TMP/geist.zip"
  unzip -q "$TMP/geist.zip" -d "$TMP"
  find "$TMP" -name 'GeistMono-*.otf' -not -path '*Variable*' -exec cp {} "$HOME/Library/Fonts/" \;
  rm -rf "$TMP"
fi

echo "完成！重启 Ghostty（或按 Cmd+Shift+, 重新加载配置）即可生效。"
