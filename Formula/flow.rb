class Flow < Formula
  desc "Flow CLI"
  homepage "https://github.com/medusa-software-hq/flow"
  url "https://github.com/medusa-software-hq/flow-releases/releases/download/0.0.28/flow-cli.jar"
  sha256 "8691e3b5fcc70a1d93c8f21ffb56c890b66013775813f4cbab96644ece8f1d2c"
  version "0.0.28"

  depends_on "openjdk@21"

  def install
    libexec.install "flow-cli.jar"
    bin.write_jar_script libexec/"flow-cli.jar", "ms-flow", "--enable-native-access=ALL-UNNAMED"
  end
end
