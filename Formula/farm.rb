class Farm < Formula
  desc "Farm CLI"
  homepage "https://github.com/medusa-software-hq/farm"
  url "https://github.com/medusa-software-hq/farm-releases/releases/download/0.0.20/farm-cli.jar"
  sha256 "73396d71b57fe91449dc2eb9105b8c6d4996584586765842c9b64de2d8dad035"
  version "0.0.20"

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
