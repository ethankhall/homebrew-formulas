class DevScope < Formula
  desc "A tool to help diagnose errors, setup machines, and report bugs to authors."
  version "2024.2.23"
  on_macos do
    on_arm do
      url "https://github.com/ethankhall/scope/releases/download/v2024.2.23/dev-scope-aarch64-apple-darwin.tar.xz"
      sha256 "5a2b01f7b9821a1eb7d3d3dc95f9e8c6c772c91c0c1c1b8dead1076ea41862e1"
    end
    on_intel do
      url "https://github.com/ethankhall/scope/releases/download/v2024.2.23/dev-scope-x86_64-apple-darwin.tar.xz"
      sha256 "930d231cc833ba5a4fa3b34b0f6e1bf251fa406ec354644c77a0a9b947d47adb"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/ethankhall/scope/releases/download/v2024.2.23/dev-scope-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "92b180a2cc7eca77501709b3e43bed9797c7a45debbffe4fd7a134eab8e62933"
    end
    on_intel do
      url "https://github.com/ethankhall/scope/releases/download/v2024.2.23/dev-scope-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "c5246d26bec96ff09f5e775b5bf48009be71cdb4939773b6f53c2e59251eb316"
    end
  end
  license "BSD-3-Clause"

  def install
    on_macos do
      on_arm do
        bin.install "scope", "scope-intercept"
      end
    end
    on_macos do
      on_intel do
        bin.install "scope", "scope-intercept"
      end
    end
    on_linux do
      on_arm do
        bin.install "scope", "scope-intercept"
      end
    end
    on_linux do
      on_intel do
        bin.install "scope", "scope-intercept"
      end
    end

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install *leftover_contents unless leftover_contents.empty?
  end
end
