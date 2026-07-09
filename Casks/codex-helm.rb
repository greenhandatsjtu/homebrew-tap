cask "codex-helm" do
  version "0.2.0"
  sha256 "cb990f36d6cb10f9d758d9dac8331d87dcb4b9fd7ba2f722f82c52771c83cbf6"

  url "https://github.com/greenhandatsjtu/codex-helm-release/releases/download/v#{version}/codex-helm-#{version}.zip"
  name "Codex Helm"
  desc "Native macOS app for managing Codex provider/model configuration"
  homepage "https://github.com/greenhandatsjtu/codex-config-desktop"

  depends_on macos: :sequoia

  app "Codex Helm.app"

  binary "#{appdir}/Codex Helm.app/Contents/MacOS/CodexLocalEnhancer", target: "codex-local-enhancer"

  zap trash: [
    "~/Library/Caches/com.bytedance.codex-config-desktop",
    "~/Library/Preferences/com.bytedance.codex-config-desktop.plist",
  ]

  caveats <<~EOS
    codex-local-enhancer has been linked to #{HOMEBREW_PREFIX}/bin/.

    On first launch, macOS may block the app (unsigned).
    Right-click the app → Open, or run:
      xattr -cr "/Applications/Codex Helm.app"
  EOS
end
