cask "codex-helm" do
  version "0.1.0"
  sha256 "c8827f87e58360ab3c04f09405b614fd8c61e82b4cf53621032efccd1703a6cb"

  url "https://github.com/greenhandatsjtu/codex-helm-release/releases/download/v#{version}/codex-helm-#{version}.zip"
  name "Codex Helm"
  desc "Native macOS app for managing Codex provider/model configuration"
  homepage "https://github.com/greenhandatsjtu/codex-config-desktop"

  depends_on macos: ">= :sequoia"

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
      xattr -cr /Applications/Codex\ Helm.app
  EOS
end
