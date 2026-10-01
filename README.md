# Ghostty Config

我的 [Ghostty](https://ghostty.org) 终端配置（macOS）。

- **配色**：自制 Paper A11y 主题，浅色 / 深色跟随系统切换，16 色对比度均 ≥ 4.5:1（WCAG AA）
- **字体**：Geist Mono，中文回退苹方，14 号，行高 +15%
- **兜底**：`minimum-contrast = 4.5`，程序输出的低对比度颜色会被自动调整

## 一键安装

```bash
curl -fsSL https://raw.githubusercontent.com/Soyn/ghostty-config/main/install.sh | bash
```

脚本会安装主题、写入配置（旧配置自动备份为 `config.bak.<时间戳>`），并安装 Geist Mono 字体（优先 Homebrew，否则从 GitHub 下载）。完成后重启 Ghostty 或按 `Cmd + Shift + ,` 重新加载。

## 文件

| 文件 | 说明 |
| --- | --- |
| `config` | 主配置 |
| `themes/paper-a11y` | 浅色主题 |
| `themes/paper-a11y-dark` | 深色主题 |
| `install.sh` | 一键安装脚本（已内嵌以上所有内容） |
