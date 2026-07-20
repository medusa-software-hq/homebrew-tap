class Flow < Formula
  desc "Flow CLI"
  homepage "https://github.com/medusa-software-hq/flow"
  url "https://github.com/medusa-software-hq/flow-releases/releases/download/0.0.37/flow-cli.jar"
  sha256 "1854e59a42a6877d79df262170cd2bb1593ef445fb774ec46a29b7dd93c9cbd7"
  version "0.0.37"

  depends_on "openjdk@21"

  def install
    libexec.install "flow-cli.jar"
    bin.write_jar_script libexec/"flow-cli.jar", "ms-flow", "--enable-native-access=ALL-UNNAMED"
  end
end
