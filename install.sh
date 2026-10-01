#!/usr/bin/env bash
# One-line Ghostty setup: Paper A11y themes + Geist Mono font
set -euo pipefail

THEME_DIR="$HOME/.config/ghostty/themes"
CONF_DIR="$HOME/Library/Application Support/com.mitchellh.ghostty"
CONF="$CONF_DIR/config"
TS=$(date +%Y%m%d%H%M%S)

mkdir -p "$THEME_DIR" "$CONF_DIR"

# Back up any existing config
[ -f "$CONF" ] && cp "$CONF" "$CONF.bak.$TS" && echo "Backed up existing config -> $CONF.bak.$TS"

# ---- Themes ----
cat > "$THEME_DIR/paper-a11y" <<'THEME'
# Paper A11y - a light, WCAG AA friendly Ghostty theme
# All 16 colors have a contrast ratio >= 4.5:1 on background #FBFAF7
background = #FBFAF7
foreground = #1C1E21
cursor-color = #0E6B5C
cursor-text = #FFFFFF
selection-background = #CFE3DE
selection-foreground = #1C1E21

# Normal colors
palette = 0=#1C1E21
palette = 1=#B42318
palette = 2=#1A7F37
palette = 3=#8A5A00
palette = 4=#1F5FBF
palette = 5=#8E3FA0
palette = 6=#0E6B5C
palette = 7=#5A5F66
# Bright colors (darkened for emphasis on a light background)
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
# Paper A11y Dark - the dark companion to paper-a11y
# All 16 colors have a contrast ratio >= 4.5:1 on background #17191C
background = #17191C
foreground = #E6E4DF
cursor-color = #4FBFAB
cursor-text = #17191C
selection-background = #2F4A45
selection-foreground = #E6E4DF

# Normal colors
palette = 0=#7E8187
palette = 1=#F2706A
palette = 2=#5CBF74
palette = 3=#D9A441
palette = 4=#6FA3F0
palette = 5=#C987D9
palette = 6=#4FBFAB
palette = 7=#B8B5AE
# Bright colors
palette = 8=#8A8D93
palette = 9=#FF9A93
palette = 10=#86D99A
palette = 11=#F0C46E
palette = 12=#9CC2FA
palette = 13=#DEAEEA
palette = 14=#82D9C9
palette = 15=#F5F3EE
THEME

# ---- Main config ----
cat > "$CONF" <<'CONF'
# ---- Colors ----
theme = light:paper-a11y,dark:paper-a11y-dark
# Safety net: Ghostty adjusts any program output color with contrast below 4.5:1
minimum-contrast = 4.5

# ---- Font ----
font-family = Geist Mono
# Fall back to PingFang SC for Chinese characters
font-family = PingFang SC
font-size = 14
# 15% extra line height for easier reading over long sessions
adjust-cell-height = 15%
CONF

# ---- Font: Geist Mono ----
if ls "$HOME/Library/Fonts"/GeistMono-* >/dev/null 2>&1; then
  echo "Geist Mono is already installed"
elif command -v brew >/dev/null 2>&1; then
  brew install --cask font-geist-mono
else
  echo "Homebrew not found, downloading Geist Mono from GitHub..."
  TMP=$(mktemp -d)
  URL=$(curl -fsSL https://api.github.com/repos/vercel/geist-font/releases/latest \
        | grep -o '"browser_download_url": *"[^"]*\.zip"' | head -1 | cut -d'"' -f4)
  curl -fsSL "$URL" -o "$TMP/geist.zip"
  unzip -q "$TMP/geist.zip" -d "$TMP"
  find "$TMP" -name 'GeistMono-*.otf' -not -path '*Variable*' -exec cp {} "$HOME/Library/Fonts/" \;
  rm -rf "$TMP"
fi

echo "Done! Restart Ghostty (or press Cmd+Shift+, to reload the config) to apply."
