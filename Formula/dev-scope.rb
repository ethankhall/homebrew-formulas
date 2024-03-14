class DevScope < Formula
  desc "A tool to help diagnose errors, setup machines, and report bugs to authors."
  version "2024.2.21"
  on_macos do
    on_arm do
      url "https://github.com/ethankhall/scope/releases/download/v2024.2.21/dev-scope-aarch64-apple-darwin.tar.xz"
      sha256 "f419aeedcf6714b77c17271f157f2603bca59e892c02d81078abbb61b5a49dd0"
    end
    on_intel do
      url "https://github.com/ethankhall/scope/releases/download/v2024.2.21/dev-scope-x86_64-apple-darwin.tar.xz"
      sha256 "2dc094c8ae94ca1ad28991fc9bfaa231ee939f71f9816f0ba4f3161f2fed9e37"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/ethankhall/scope/releases/download/v2024.2.21/dev-scope-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "b9d95076b5ab3200c9f879985b9ff44de960778aad0e5f0c0cad378b17c94678"
    end
    on_intel do
      url "https://github.com/ethankhall/scope/releases/download/v2024.2.21/dev-scope-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "80d9efe6b97ba5ad979b752830ce2a7172c5bd6bd20b06fb5f05710b0a08b618"
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
