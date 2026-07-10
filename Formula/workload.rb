class Workload < Formula
  desc "Workload CLI"
  homepage "https://github.com/medusa-software-hq/workload"
  url "https://github.com/medusa-software-hq/workload-releases/releases/download/0.0.4/workload-cli.jar"
  sha256 "06111e1bbc951bc254fa63920867e0ac81e301a1a60464035dbf0cfaa2d71542"
  version "0.0.4"

  depends_on "openjdk@21"

  def install
    libexec.install "workload-cli.jar"
    bin.write_jar_script libexec/"workload-cli.jar", "ms-workload", "--enable-native-access=ALL-UNNAMED"
  end
end
