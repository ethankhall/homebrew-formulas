class DevScope < Formula
  desc "A tool to help diagnose errors, setup machines, and report bugs to authors."
  version "2024.2.14"
  on_macos do
    on_arm do
      url "https://github.com/ethankhall/scope/releases/download/dev-scope-v2024.2.14/dev-scope-aarch64-apple-darwin.tar.xz"
      sha256 "da622a7b41217d1c2c8ec44543c9b4a3db8bdeeb8b61212bb8872c1d6d8dacc0"
    end
    on_intel do
      url "https://github.com/ethankhall/scope/releases/download/dev-scope-v2024.2.14/dev-scope-x86_64-apple-darwin.tar.xz"
      sha256 "a2a662a56a2d1b8bcbf3ab77a60726262b662def95894934f6500f0b3b5d60a9"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/ethankhall/scope/releases/download/dev-scope-v2024.2.14/dev-scope-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "e665d4323699f17709320a9f93c9ca48a238e854fe84ab8c1b77c6621b2d8917"
    end
    on_intel do
      url "https://github.com/ethankhall/scope/releases/download/dev-scope-v2024.2.14/dev-scope-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "72acf96474746fd3207af93780bdb1f602c42cc639283162ed5045b16fd05381"
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
