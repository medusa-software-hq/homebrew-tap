class Flow < Formula
  desc "Flow CLI"
  homepage "https://github.com/medusa-software-hq/flow"
  url "https://github.com/medusa-software-hq/flow-releases/releases/download/0.0.48/flow-cli.jar"
  sha256 "e2cdebc12d7c3124b1c0736bf0e382e30a7c7862855f6dd0ec00a9f4b5140cd6"
  version "0.0.48"

  depends_on "openjdk@21"

  def install
    libexec.install "flow-cli.jar"
    bin.write_jar_script libexec/"flow-cli.jar", "ms-flow", "--enable-native-access=ALL-UNNAMED"
  end
end
