class Workload < Formula
  desc "Workload CLI"
  homepage "https://github.com/medusa-software-hq/workload"
  url "https://github.com/medusa-software-hq/workload-releases/releases/download/0.0.45/workload-cli.jar"
  sha256 "a40600c52337a6a53b4f6188f0cb73ae3a730561b75484b73d66c20e9861dd7e"
  version "0.0.45"

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
