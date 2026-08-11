class Farm < Formula
  desc "Farm CLI"
  homepage "https://github.com/medusa-software-hq/farm"
  url "https://github.com/medusa-software-hq/farm-releases/releases/download/0.0.7/farm-cli.jar"
  sha256 "2687466e9451ff2916623fe1e8383528ce9a748035ec06edea12e10097a2122f"
  version "0.0.7"

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
