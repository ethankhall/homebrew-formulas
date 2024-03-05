class DevScope < Formula
  desc "A tool to help diagnose errors, setup machines, and report bugs to authors."
  version "2024.2.8"
  on_macos do
    on_arm do
      url "https://github.com/ethankhall/scope/releases/download/v2024.2.8/dev-scope-aarch64-apple-darwin.tar.xz"
      sha256 "36b334e3b2356d5fb3ec1fad8304cccd0d4b4d1a1395ceb0179eb85cc00cb7cf"
    end
    on_intel do
      url "https://github.com/ethankhall/scope/releases/download/v2024.2.8/dev-scope-x86_64-apple-darwin.tar.xz"
      sha256 "b3f37d92b11c75dfdff742673211155ab802b9462e3f5bcf43dd5a5228a9b5fa"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/ethankhall/scope/releases/download/v2024.2.8/dev-scope-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "ea9f5043af70c6ac30f83d220bac5067297d9fbad7ad3ae47bc787f5a1121d59"
    end
    on_intel do
      url "https://github.com/ethankhall/scope/releases/download/v2024.2.8/dev-scope-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "51c2eb9123120bfeaf07da9c7dfde32bfda3d23e9ce222fee1c8a62bc4d12996"
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
