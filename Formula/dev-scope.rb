class DevScope < Formula
  desc "A tool to help diagnose errors, setup machines, and report bugs to authors."
  version "2024.2.15"
  on_macos do
    on_arm do
      url "https://github.com/ethankhall/scope/releases/download/dev-scope-v2024.2.15/dev-scope-aarch64-apple-darwin.tar.xz"
      sha256 "5fbda93614226830029112bd2266b226a297f9455f7d5d1f569139d6ab12e376"
    end
    on_intel do
      url "https://github.com/ethankhall/scope/releases/download/dev-scope-v2024.2.15/dev-scope-x86_64-apple-darwin.tar.xz"
      sha256 "fb766440f51023aec731122024ee0cb74014a588b07e0d75428babb31fb13515"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/ethankhall/scope/releases/download/dev-scope-v2024.2.15/dev-scope-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "50fdc3ce4f19b3264956a0eabefa2ecf3ea212c450e15944b809902040f92698"
    end
    on_intel do
      url "https://github.com/ethankhall/scope/releases/download/dev-scope-v2024.2.15/dev-scope-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "e8842cdac78330d587cd8e9d242c0c0d9c1fc36a04b9e1fb487f0653a6900959"
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
