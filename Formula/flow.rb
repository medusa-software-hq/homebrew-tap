class Flow < Formula
  desc "Flow CLI"
  homepage "https://github.com/medusa-software-hq/flow"
  url "https://github.com/medusa-software-hq/flow-releases/releases/download/0.0.62/flow-cli.jar"
  sha256 "1225c3970f6b9d3556a8730baa72de24fddb0ef992c66828d16370541901232c"
  version "0.0.62"

  depends_on "openjdk@21"

  def install
    libexec.install "flow-cli.jar"
    # java_version pins the launcher to the openjdk@21 we depend on and build against.
    # Without it, write_jar_script defaults to "any JDK" — so the declared dependency is
    # installed but never used, and the CLI runs on whatever JDK is newest (e.g. JDK 24),
    # where Netty's sun.misc.Unsafe calls print JEP 498 deprecation warnings over the output.
    bin.write_jar_script libexec/"flow-cli.jar",
                         "ms-flow",
                         "--enable-native-access=ALL-UNNAMED",
                         java_version: "21"
  end
end
