# Documentation: https://docs.brew.sh/Formula-Cookbook
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
class Goku < Formula
  desc "karabiner configurator"
  homepage "https://github.com/erics118/GokuRakuJoudo"
  version "0.8.1"
  head "https://github.com/erics118/GokuRakuJoudo.git", branch: "master"

  on_macos do
    on_arm do
      url "https://github.com/erics118/GokuRakuJoudo/releases/download/v0.8.1/goku-aarch64-apple-darwin.zip"
      sha256 "0706cd800078b806ba745325384efbe72db5c755aa20e45a48613adf3618dd1c"
    end
    on_intel do
      url "https://github.com/erics118/GokuRakuJoudo/releases/download/v0.8.1/goku-x86_64-apple-darwin.zip"
      sha256 "9d2268ab659acc37c2d2a779070b8b3fe9a0e50229d95bf9e33f060de8690e43"
    end
  end

  depends_on "watchexec"

  def install
    bin.install "goku"
    bin.install "gokuw"
  end

  service do
    run "#{opt_bin}/gokuw"
    environment_variables PATH: std_service_path_env
    keep_alive true
    run_at_load true
    log_path "#{ENV["HOME"]}/Library/Logs/goku.log"
    error_log_path "#{ENV["HOME"]}/Library/Logs/goku.log"
  end

  test do
    system "#{bin}/goku", "--help"
  end
end
