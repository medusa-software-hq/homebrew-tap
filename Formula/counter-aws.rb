class CounterAws < Formula
  desc "Counter CLI (AWS variant)"
  homepage "https://github.com/medusa-software-hq/counter-aws"
  url "https://github.com/medusa-software-hq/counter-aws-releases/releases/download/0.0.13/counter-cli.jar"
  sha256 "bdfc133d2fe99c0c0705f309ec9e3d6513f68e3d896e656303519f51088d81c6"
  version "0.0.13"

  depends_on "openjdk@21"

  # Same `ms-counter` binary as the GCP counter formula — install one.
  conflicts_with "counter", because: "both install the ms-counter binary"

  def install
    libexec.install "counter-cli.jar"
    # java_version pins the launcher to the openjdk@21 we depend on and build against, so the
    # CLI never silently runs on a newer JDK (where Clikt's JNA calls print JEP 498 warnings).
    bin.write_jar_script libexec/"counter-cli.jar",
                         "ms-counter",
                         "--enable-native-access=ALL-UNNAMED",
                         java_version: "21"
  end
end
