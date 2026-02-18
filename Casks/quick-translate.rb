cask "quick-translate" do
  version "0.1.0"
  sha256 "4be3b4337c5037c3387a953a9cbfa7c277784a2a7c0758cef5c871bf3fdfc24e"

  url "https://github.com/gawasa29/macos-quick-translate/releases/download/v0.1.0/QuickTranslate-v0.1.0.zip"
  name "Quick Translate"
  desc "Quick translator in the macOS menu bar"
  homepage "https://github.com/gawasa29/macos-quick-translate"

  auto_updates false

  app "Quick Translate.app"

  uninstall quit: "dev.gawasa.quick-translate-macos",
            delete: "~/Library/LaunchAgents/dev.gawasa.quick-translate-macos.plist"

  zap trash: [
    "~/Library/Preferences/dev.gawasa.quick-translate-macos.plist"
  ]
end
