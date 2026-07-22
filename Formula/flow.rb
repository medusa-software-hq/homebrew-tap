class Flow < Formula
  desc "Flow CLI"
  homepage "https://github.com/medusa-software-hq/flow"
  url "https://github.com/medusa-software-hq/flow-releases/releases/download/0.0.55/flow-cli.jar"
  sha256 "a8037ea13d0adf6d504b0ff8a01c5704ab7b5f1304b946c14779fee72b803bc2"
  version "0.0.55"

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
