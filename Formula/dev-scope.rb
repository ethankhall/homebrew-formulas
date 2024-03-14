class DevScope < Formula
  desc "A tool to help diagnose errors, setup machines, and report bugs to authors."
  version "2024.2.16"
  on_macos do
    on_arm do
      url "https://github.com/ethankhall/scope/releases/download/dev-scope-v2024.2.16/dev-scope-aarch64-apple-darwin.tar.xz"
      sha256 "d0760bd5d139d18670609425028bea64473a7889b11b2b4f605d59b528b9edc8"
    end
    on_intel do
      url "https://github.com/ethankhall/scope/releases/download/dev-scope-v2024.2.16/dev-scope-x86_64-apple-darwin.tar.xz"
      sha256 "37afa02c96d224895e65d697ca06ae43cb113763ffec845eec6d42a5023c6296"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/ethankhall/scope/releases/download/dev-scope-v2024.2.16/dev-scope-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "7c255d3f8ddf4443d59babfdcb88b35fb2fbc24e6624780080d47aadf7983ea4"
    end
    on_intel do
      url "https://github.com/ethankhall/scope/releases/download/dev-scope-v2024.2.16/dev-scope-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "f2690ed9952eb986ab1c11c04ce10c2ae78634468dad99c7ef77c75156157e28"
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
