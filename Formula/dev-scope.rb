class DevScope < Formula
  desc "A tool to help diagnose errors, setup machines, and report bugs to authors."
  version "2024.2.6"
  on_macos do
    on_arm do
      url "https://github.com/ethankhall/scope/releases/download/v2024.2.6/dev-scope-aarch64-apple-darwin.tar.xz"
      sha256 "6f0dfc21e4ab3c30126b03ee48bd93c88d3247441c71fa307675bee19129bfb4"
    end
    on_intel do
      url "https://github.com/ethankhall/scope/releases/download/v2024.2.6/dev-scope-x86_64-apple-darwin.tar.xz"
      sha256 "e9856f6b0e43f74fb95e66f7307011f63ca63bcf00025cd15349648d29759a6c"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/ethankhall/scope/releases/download/v2024.2.6/dev-scope-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "bb83c039af52f66599c31a181409e1ac0559862e72f95dc2921d197907777dbf"
    end
    on_intel do
      url "https://github.com/ethankhall/scope/releases/download/v2024.2.6/dev-scope-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "e9b22d41e6323a798f8a2f5fc09d41a929aacff25d4ea83f2882c7cc768addff"
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
