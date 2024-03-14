class DevScope < Formula
  desc "A tool to help diagnose errors, setup machines, and report bugs to authors."
  version "2024.2.18"
  on_macos do
    on_arm do
      url "https://github.com/ethankhall/scope/releases/download/v2024.2.18/dev-scope-aarch64-apple-darwin.tar.xz"
      sha256 "6db19b5337be704b778cd76b1bb70f536ed95f179e73d29121ee7a5f345715cd"
    end
    on_intel do
      url "https://github.com/ethankhall/scope/releases/download/v2024.2.18/dev-scope-x86_64-apple-darwin.tar.xz"
      sha256 "15aa864a7a7dbd2c59b964b857b335f143a4cf1a23f3778e37731906146255db"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/ethankhall/scope/releases/download/v2024.2.18/dev-scope-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "62369316d5ace023d5773fcbee7f683ccce954e895c4d7d3158521ba7dd6f9bd"
    end
    on_intel do
      url "https://github.com/ethankhall/scope/releases/download/v2024.2.18/dev-scope-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "ddb98be383021ce7de9ff1ae6fdff5bf813c359b2d2d54dc3c7025cddfddf55d"
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
