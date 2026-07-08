class Workload < Formula
  desc "Workload CLI"
  homepage "https://github.com/medusa-software-hq/workload"
  url "https://github.com/medusa-software-hq/workload-releases/releases/download/0.0.3/workload-cli.jar"
  sha256 "bdae90f57e47508c7d0d0c13cd8c6080704ee9b695ccbbb3ef8585afa96af128"
  version "0.0.3"

  depends_on "openjdk@21"

  def install
    libexec.install "workload-cli.jar"
    bin.write_jar_script libexec/"workload-cli.jar", "ms-workload", "--enable-native-access=ALL-UNNAMED"
  end
end
