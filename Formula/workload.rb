class Workload < Formula
  desc "Workload CLI"
  homepage "https://github.com/medusa-software-hq/workload"
  url "https://github.com/medusa-software-hq/workload-releases/releases/download/0.0.6/workload-cli.jar"
  sha256 "1860ce14df7367097140ee00426b7fead276e786a895e83309a68f58ec1a3b64"
  version "0.0.6"

  depends_on "openjdk@21"

  def install
    libexec.install "workload-cli.jar"
    bin.write_jar_script libexec/"workload-cli.jar", "ms-workload", "--enable-native-access=ALL-UNNAMED"
  end
end
