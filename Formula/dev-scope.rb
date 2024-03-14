class DevScope < Formula
  desc "A tool to help diagnose errors, setup machines, and report bugs to authors."
  version "2024.2.9"
  on_macos do
    on_arm do
      url "https://github.com/ethankhall/scope/releases/download/v2024.2.9/dev-scope-aarch64-apple-darwin.tar.xz"
      sha256 "28ec518ac79a5d37fa4cfebfa6178535d5c82aa39d1d2154ebcb8f7fee344de1"
    end
    on_intel do
      url "https://github.com/ethankhall/scope/releases/download/v2024.2.9/dev-scope-x86_64-apple-darwin.tar.xz"
      sha256 "b4757c6c32ac543a46817b4f31acb29a5523823c279e36cf6f434b70d93ba8d7"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/ethankhall/scope/releases/download/v2024.2.9/dev-scope-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "298794698845a7c2a92efdfca398798e1f4ee180c1dddc32458a151fe813b070"
    end
    on_intel do
      url "https://github.com/ethankhall/scope/releases/download/v2024.2.9/dev-scope-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "5439f8e7f3b7f59122b2ad44fc6608415b24abd10bd86035395a16ebeba4604a"
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
