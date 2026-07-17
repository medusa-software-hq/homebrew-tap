class Workload < Formula
  desc "Workload CLI"
  homepage "https://github.com/medusa-software-hq/workload"
  url "https://github.com/medusa-software-hq/workload-releases/releases/download/0.0.12/workload-cli.jar"
  sha256 "ad60df97aad8f77a30b8638071f9835cfa9ae7eaf0e1058273f38ac534dd6dd9"
  version "0.0.12"

  depends_on "openjdk@21"

  def install
    libexec.install "workload-cli.jar"
    bin.write_jar_script libexec/"workload-cli.jar", "ms-workload", "--enable-native-access=ALL-UNNAMED"
  end
end
