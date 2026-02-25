cask "quick-translate" do
  version "0.1.1"
  sha256 "aea69c193c66a14ed190b3eb5e58e011e64f4ee238e5f62ed4d1a6982aa8678c"

  url "https://github.com/gawasa29/macos-quick-translate/releases/download/v0.1.1/QuickTranslate-v0.1.1.zip"
  name "Quick Translate"
  desc "Quick translator in the macOS menu bar"
  homepage "https://github.com/gawasa29/macos-quick-translate"

  auto_updates false

  app "Quick Translate.app"

  postflight do
    # Non-notarized builds may be blocked by Gatekeeper as "damaged".
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Quick Translate.app"],
                   sudo: !appdir.writable?
  end

  caveats <<~EOS
    If macOS still says this app is damaged, run:
      APP_PATH="/Applications/Quick Translate.app"
      [[ -d "$HOME/Applications/Quick Translate.app" ]] && APP_PATH="$HOME/Applications/Quick Translate.app"
      xattr -dr com.apple.quarantine "$APP_PATH"
      open "$APP_PATH"
  EOS

  uninstall quit: "dev.gawasa.quick-translate-macos",
            delete: "~/Library/LaunchAgents/dev.gawasa.quick-translate-macos.plist"

  zap trash: [
    "~/Library/Preferences/dev.gawasa.quick-translate-macos.plist"
  ]
end
