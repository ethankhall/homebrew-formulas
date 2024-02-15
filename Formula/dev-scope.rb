class DevScope < Formula
  desc "A tool to help diagnose errors, setup machines, and report bugs to authors."
  version "2024.2.7"
  on_macos do
    on_arm do
      url "https://github.com/ethankhall/scope/releases/download/v2024.2.7/dev-scope-aarch64-apple-darwin.tar.xz"
      sha256 "c4ecfaa5d740c9d54d4b03548b29a36ee6308486a3dccbb01ff1e38f38ceac3a"
    end
    on_intel do
      url "https://github.com/ethankhall/scope/releases/download/v2024.2.7/dev-scope-x86_64-apple-darwin.tar.xz"
      sha256 "d5a804e9e0228dd09740c5586bbd33935c1f38c140138d4e4d35b6ee1609419d"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/ethankhall/scope/releases/download/v2024.2.7/dev-scope-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "5c8bc232da531d612b38d2ebad583180c7ea3c3bff5024e30e775dc4d68add2e"
    end
    on_intel do
      url "https://github.com/ethankhall/scope/releases/download/v2024.2.7/dev-scope-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "318bd6c5421e59796f94a43da224d777bc444b646a7361a7151cb294b4fbdd11"
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
