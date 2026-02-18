cask "quick-translate" do
  version "0.1.0"
  sha256 "72aa34e0e6ece8be3fa74879fcfad372e97e7d9c85ba211f61680720dc5b1734"

  url "https://github.com/gawasa29/Projects/releases/download/macos-quick-translate-v0.1.0/QuickTranslate-macos-quick-translate-v0.1.0.zip"
  name "Quick Translate"
  desc "Quick translator in the macOS menu bar"
  homepage "https://github.com/gawasa29/Projects/tree/main/macos-quick-translate"

  auto_updates false

  app "Quick Translate.app"

  uninstall quit: "dev.gawasa.quick-translate-macos",
            delete: "~/Library/LaunchAgents/dev.gawasa.quick-translate-macos.plist"

  zap trash: [
    "~/Library/Preferences/dev.gawasa.quick-translate-macos.plist"
  ]
end
