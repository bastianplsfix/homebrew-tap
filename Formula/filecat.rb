class Filecat < Formula
  desc "CLI tool that concatenates files with smart comment headers and tree reports"
  homepage "https://github.com/bastianplsfix/filecat"
  version "0.0.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/bastianplsfix/filecat/releases/download/v#{version}/filecat-darwin-x86_64.tar.gz"
      sha256 "71512e2de0505caba2dd4905c748d23ed26a756670130d2d08bbb9ab84d58832"
    end

    on_arm do
      url "https://github.com/bastianplsfix/filecat/releases/download/v#{version}/filecat-darwin-aarch64.tar.gz"
      sha256 "fce3802e0c55314fafe6c0cd4da012a17708c40d57160ebe924a70598beeacd4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/bastianplsfix/filecat/releases/download/v#{version}/filecat-linux-x86_64.tar.gz"
      sha256 "857a9c911eaab33f8dc71a74aa1c8ae5c7205c994f9d52f09249c672cd8ff8de"
    end
  end

  def install
    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "filecat-darwin-aarch64" => "filecat"
      else
        bin.install "filecat-darwin-x86_64" => "filecat"
      end
    elsif OS.linux?
      bin.install "filecat-linux-x86_64" => "filecat"
    end
  end

  test do
    system "#{bin}/filecat", "--help"
  end
end
