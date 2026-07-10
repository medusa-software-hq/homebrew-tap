class Flow < Formula
  desc "Flow CLI"
  homepage "https://github.com/medusa-software-hq/flow"
  url "https://github.com/medusa-software-hq/flow-releases/releases/download/0.0.24/flow-cli.jar"
  sha256 "9622226355329aeaa3c5ecc01dbf7fa14f67d0a93c97e2f2f4fd42274b0dcbc3"
  version "0.0.24"

  depends_on "openjdk@21"

  def install
    libexec.install "flow-cli.jar"
    bin.write_jar_script libexec/"flow-cli.jar", "ms-flow", "--enable-native-access=ALL-UNNAMED"
  end
end
