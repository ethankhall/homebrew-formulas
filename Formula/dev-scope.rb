class DevScope < Formula
  desc "A tool to help diagnose errors, setup machines, and report bugs to authors."
  version "2024.2.20"
  on_macos do
    on_arm do
      url "https://github.com/ethankhall/scope/releases/download/v2024.2.20/dev-scope-aarch64-apple-darwin.tar.xz"
      sha256 "012669cd1969b6df72a97ea05fbedc10805919957cf194fb45f57fdf08d3e2b5"
    end
    on_intel do
      url "https://github.com/ethankhall/scope/releases/download/v2024.2.20/dev-scope-x86_64-apple-darwin.tar.xz"
      sha256 "c1fdffdb491a80c0b0495a8d4ae0c05b92de67f870ba352a6aef8d9e53c6183d"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/ethankhall/scope/releases/download/v2024.2.20/dev-scope-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "f354f997108a671af69129aa02c8611f585c5159d73317d8650e70ff909845e7"
    end
    on_intel do
      url "https://github.com/ethankhall/scope/releases/download/v2024.2.20/dev-scope-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "f2db6019518ec7a34dc5bc7329dbed8f90ba60d7fa023fd004a7302c9ad38af6"
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
