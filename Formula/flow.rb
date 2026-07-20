class Flow < Formula
  desc "Flow CLI"
  homepage "https://github.com/medusa-software-hq/flow"
  url "https://github.com/medusa-software-hq/flow-releases/releases/download/0.0.40/flow-cli.jar"
  sha256 "c98d7f950a5d44e7666112a1d0aec61fed41cdff8a2e9f6ef12888c68fa2ffd0"
  version "0.0.40"

  depends_on "openjdk@21"

  def install
    libexec.install "flow-cli.jar"
    bin.write_jar_script libexec/"flow-cli.jar", "ms-flow", "--enable-native-access=ALL-UNNAMED"
  end
end
