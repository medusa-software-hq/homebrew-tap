class Flow < Formula
  desc "Flow CLI"
  homepage "https://github.com/medusa-software-hq/flow"
  url "https://github.com/medusa-software-hq/flow-releases/releases/download/0.0.6/flow-cli.jar"
  sha256 "29e4d0ed27ff59b580c8bce61f77056ddd00992de25339f2c0d9dc1b74103f0c"
  version "0.0.6"

  depends_on "openjdk@21"

  def install
    libexec.install "flow-cli.jar"
    bin.write_jar_script libexec/"flow-cli.jar", "ms-flow"
  end
end
