class DevScope < Formula
  desc "A tool to help diagnose errors, setup machines, and report bugs to authors."
  version "2024.2.22"
  on_macos do
    on_arm do
      url "https://github.com/ethankhall/scope/releases/download/v2024.2.22/dev-scope-aarch64-apple-darwin.tar.xz"
      sha256 "5c84429a6389a68879c125bc0615656dab3af1f9934edd18b7ccb39e27b13993"
    end
    on_intel do
      url "https://github.com/ethankhall/scope/releases/download/v2024.2.22/dev-scope-x86_64-apple-darwin.tar.xz"
      sha256 "4c0fa1f8dc4eb14cf58ff8b46764da58e115cf19008aa7e6e6804cdd4a3757a3"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/ethankhall/scope/releases/download/v2024.2.22/dev-scope-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "d39ccac5af1210a8485138b24cff5f54cd9e5230cbfb1ddd21c4a23809e5526f"
    end
    on_intel do
      url "https://github.com/ethankhall/scope/releases/download/v2024.2.22/dev-scope-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "5abc4159a4ca6d161a02930322ecf95beb9b4f2418a06204453f7c13d9e9865f"
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
