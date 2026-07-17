class Flow < Formula
  desc "Flow CLI"
  homepage "https://github.com/medusa-software-hq/flow"
  url "https://github.com/medusa-software-hq/flow-releases/releases/download/0.0.30/flow-cli.jar"
  sha256 "7b0e9f2d42c26309d662c50782905967868af141f0cebdfe3216ee475457f1d2"
  version "0.0.30"

  depends_on "openjdk@21"

  def install
    libexec.install "flow-cli.jar"
    bin.write_jar_script libexec/"flow-cli.jar", "ms-flow", "--enable-native-access=ALL-UNNAMED"
  end
end
