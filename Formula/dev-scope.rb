class DevScope < Formula
  desc "A tool to help diagnose errors, setup machines, and report bugs to authors."
  version "2024.2.24"
  on_macos do
    on_arm do
      url "https://github.com/ethankhall/scope/releases/download/v2024.2.24/dev-scope-aarch64-apple-darwin.tar.xz"
      sha256 "013c0760b7896a0c6a51b09d948241a5bf4e91667bb656a34ecab39aaa47c3fc"
    end
    on_intel do
      url "https://github.com/ethankhall/scope/releases/download/v2024.2.24/dev-scope-x86_64-apple-darwin.tar.xz"
      sha256 "fd575f85ced9dc7d4c334019f18ce1b051315f8273885a8e38c2d41aa122fa2b"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/ethankhall/scope/releases/download/v2024.2.24/dev-scope-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "9c0e3424ead80b571f3b3a8039ff7ac3ad165824023b69e17629e74ad7fbb7fe"
    end
    on_intel do
      url "https://github.com/ethankhall/scope/releases/download/v2024.2.24/dev-scope-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "345b68dca3d06c5677c8022dc1517447d79d4a3ac50e7bcfc5bf4b3d76e8042f"
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
