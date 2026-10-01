# Ghostty Config

My [Ghostty](https://ghostty.org) terminal config for macOS.

- **Colors**: custom Paper A11y themes, light and dark, switching with the system appearance. All 16 palette colors meet a contrast ratio of at least 4.5:1 (WCAG AA).
- **Font**: Geist Mono at 14pt with 15% extra line height, falling back to PingFang SC for Chinese.
- **Safety net**: `minimum-contrast = 4.5`, so Ghostty automatically adjusts any low-contrast colors that programs output.

## One-line install

```bash
curl -fsSL https://raw.githubusercontent.com/Soyn/ghostty-config/main/install.sh | bash
```

The script installs the themes, writes the config (backing up any existing one as `config.bak.<timestamp>`), and installs Geist Mono (via Homebrew if available, otherwise from GitHub). Then restart Ghostty or press `Cmd + Shift + ,` to reload the config.

## Set up with an AI assistant

Paste the contents of [`PROMPT.md`](PROMPT.md) into Claude Code (or any AI assistant that can run commands). It will install Ghostty if needed, review the script before running it, verify the result, and ask before merging any settings from your old config.

## Files

| File | Description |
| --- | --- |
| `config` | Main config |
| `themes/paper-a11y` | Light theme |
| `themes/paper-a11y-dark` | Dark theme |
| `PROMPT.md` | Setup prompt for AI assistants |
| `install.sh` | One-line install script (embeds the config and both themes) |
