Set up the Ghostty terminal on this Mac as an exact copy of this repo: https://github.com/Soyn/ghostty-config

Do the following in order:
1. Check whether Ghostty is installed (/Applications/Ghostty.app or `command -v ghostty`). If it isn't, install it with `brew install --cask ghostty` when Homebrew is available; if Homebrew isn't available, stop and ask me.
2. Read https://raw.githubusercontent.com/Soyn/ghostty-config/main/install.sh first and confirm it only does these things: writes the themes and config, backs up any existing config, and installs the Geist Mono font. Once confirmed, run:
   curl -fsSL https://raw.githubusercontent.com/Soyn/ghostty-config/main/install.sh | bash
3. Verify the result:
   - ~/.config/ghostty/themes/ contains paper-a11y and paper-a11y-dark
   - ~/Library/Application Support/com.mitchellh.ghostty/config matches the repo's config file
   - ~/Library/Fonts/ contains GeistMono-*.otf
   - `ghostty +validate-config` (if available) reports no errors
4. If I had an existing Ghostty config, list the settings from the backed-up old config that the new config doesn't cover, and ask me whether to merge them in. Don't change anything on your own.
5. Finally, tell me to restart Ghostty or press Cmd+Shift+, to reload the config.
