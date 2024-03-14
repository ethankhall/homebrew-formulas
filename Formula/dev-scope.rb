class DevScope < Formula
  desc "A tool to help diagnose errors, setup machines, and report bugs to authors."
  version "2024.2.19"
  on_macos do
    on_arm do
      url "https://github.com/ethankhall/scope/releases/download/v2024.2.19/dev-scope-aarch64-apple-darwin.tar.xz"
      sha256 "a5c4307a10e333dd246811ac7db52e7cb35851bbf21ea3f7f5c1dff00363ed1f"
    end
    on_intel do
      url "https://github.com/ethankhall/scope/releases/download/v2024.2.19/dev-scope-x86_64-apple-darwin.tar.xz"
      sha256 "0216f34ab667ad13cf1babe8270a821685801cdda8ea9382a504ee303594fcb8"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/ethankhall/scope/releases/download/v2024.2.19/dev-scope-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "467460a7535590090af31b2508c5fb44a44624512acb9d5341d87d55b02f1fd9"
    end
    on_intel do
      url "https://github.com/ethankhall/scope/releases/download/v2024.2.19/dev-scope-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "993d7323d7aeaf3965e7e93b9d6d29bdbe215e44711755b6a6da7a6a45a14a2a"
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
