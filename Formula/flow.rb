class Flow < Formula
  desc "Flow CLI"
  homepage "https://github.com/medusa-software-hq/flow"
  url "https://github.com/medusa-software-hq/flow-releases/releases/download/0.0.72/flow-cli.jar"
  sha256 "6f8dc21ebe81e01732a0a9d281c51ca2f8982be3eb49303622ae6f3ffb50301d"
  version "0.0.72"

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
