帮我在这台 Mac 上配置 Ghostty 终端，完全照搬这个仓库：https://github.com/Soyn/ghostty-config

请按顺序做：
1. 检查 Ghostty 是否已安装（/Applications/Ghostty.app 或 `command -v ghostty`）。没装的话，有 Homebrew 就用 `brew install --cask ghostty` 安装，没有 Homebrew 就停下来问我。
2. 先读一遍 https://raw.githubusercontent.com/Soyn/ghostty-config/main/install.sh ，确认它只做这几件事：写入主题和配置、备份旧配置、安装 Geist Mono 字体。确认没问题后执行：
   curl -fsSL https://raw.githubusercontent.com/Soyn/ghostty-config/main/install.sh | bash
3. 检查结果：
   - ~/.config/ghostty/themes/ 下有 paper-a11y 和 paper-a11y-dark
   - ~/Library/Application Support/com.mitchellh.ghostty/config 内容与仓库里的 config 一致
   - ~/Library/Fonts/ 下有 GeistMono-*.otf
   - 运行 `ghostty +validate-config`（如果有这个命令）没有报错
4. 如果我原来有 Ghostty 配置，把被备份的旧配置里那些新配置没有覆盖到的设置列出来，问我要不要合并进去，不要自己改。
5. 最后告诉我：重启 Ghostty 或按 Cmd+Shift+, 重新加载配置。
