class Workload < Formula
  desc "Workload CLI"
  homepage "https://github.com/medusa-software-hq/workload"
  url "https://github.com/medusa-software-hq/workload-releases/releases/download/0.0.34/workload-cli.jar"
  sha256 "d7cb88cce859ea0a63d3c6bf2d9c70c0c053585f6a76bba386ecc0bd3f03eb4c"
  version "0.0.34"

  depends_on "openjdk@21"

  def install
    libexec.install "workload-cli.jar"
    # java_version pins the launcher to the openjdk@21 we depend on and build against.
    # Without it, write_jar_script defaults to "any JDK" — so the declared dependency was
    # installed but never used, and the CLI ran on whatever JDK happened to be newest
    # (or on JAVA_HOME). That is how a user ended up running it on JDK 24, where Netty's
    # sun.misc.Unsafe calls print four JEP 498 deprecation warnings over the CLI's output.
    bin.write_jar_script libexec/"workload-cli.jar",
                         "ms-workload",
                         "--enable-native-access=ALL-UNNAMED",
                         java_version: "21"
  end
end
