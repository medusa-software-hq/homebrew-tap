class Farm < Formula
  desc "Farm CLI"
  homepage "https://github.com/medusa-software-hq/farm"
  url "https://github.com/medusa-software-hq/farm-releases/releases/download/0.0.15/farm-cli.jar"
  sha256 "8d38d6554442039879a06e2b97150181774c561ae17284d78e536ae708fe2466"
  version "0.0.15"

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
