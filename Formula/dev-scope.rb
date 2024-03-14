class DevScope < Formula
  desc "A tool to help diagnose errors, setup machines, and report bugs to authors."
  version "2024.2.17"
  on_macos do
    on_arm do
      url "https://github.com/ethankhall/scope/releases/download/dev-scope-v2024.2.17/dev-scope-aarch64-apple-darwin.tar.xz"
      sha256 "e32aea7231203c16021ce6f1d463f790b9c7c2ddaa61e81f897bda1b31a7aa9f"
    end
    on_intel do
      url "https://github.com/ethankhall/scope/releases/download/dev-scope-v2024.2.17/dev-scope-x86_64-apple-darwin.tar.xz"
      sha256 "8cea7ff8ad495dbda8d05e3b0c763fb0eefe26f52337a55bc70c81a7a7275977"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/ethankhall/scope/releases/download/dev-scope-v2024.2.17/dev-scope-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "0dbcca48c1cd9f7d7350625e05c0bf84440d3c83b6f0295d38a23ebaa4c98cd5"
    end
    on_intel do
      url "https://github.com/ethankhall/scope/releases/download/dev-scope-v2024.2.17/dev-scope-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "7034a5877af59e838ee9f77cec2c2f7b4ed001e54389ec07592cdf163fa288a6"
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
