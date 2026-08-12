class Farm < Formula
  desc "Farm CLI"
  homepage "https://github.com/medusa-software-hq/farm"
  url "https://github.com/medusa-software-hq/farm-releases/releases/download/0.0.13/farm-cli.jar"
  sha256 "049cdb6040eb67605d88b409eb5a8444958603d202794e38d04e0879ff72049c"
  version "0.0.13"

  depends_on "openjdk@21"

  def install
    libexec.install "farm-cli.jar"
    # java_version pins the launcher to the openjdk@21 we depend on and build against, so the
    # CLI never silently runs on a newer JDK (where Clikt's JNA calls print JEP 498 warnings).
    bin.write_jar_script libexec/"farm-cli.jar",
                         "ms-farm",
                         "--enable-native-access=ALL-UNNAMED",
                         java_version: "21"
  end
end
