class Flow < Formula
  desc "Flow CLI"
  homepage "https://github.com/medusa-software-hq/flow"
  url "https://github.com/medusa-software-hq/flow-releases/releases/download/0.0.96/flow-cli.jar"
  sha256 "474b6979ae3de639fd237cb6c904fc2b4272f4af0f8033adc4af2250e6824811"
  version "0.0.96"

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
