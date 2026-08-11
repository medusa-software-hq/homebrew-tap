class Farm < Formula
  desc "Farm CLI"
  homepage "https://github.com/medusa-software-hq/farm"
  url "https://github.com/medusa-software-hq/farm-releases/releases/download/0.0.10/farm-cli.jar"
  sha256 "8f23b1322db924ff758f7c6cd2ce8d095964b3774b951730dca25648964a5d73"
  version "0.0.10"

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
