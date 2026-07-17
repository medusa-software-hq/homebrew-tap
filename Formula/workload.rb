class Workload < Formula
  desc "Workload CLI"
  homepage "https://github.com/medusa-software-hq/workload"
  url "https://github.com/medusa-software-hq/workload-releases/releases/download/0.0.9/workload-cli.jar"
  sha256 "64ecbeadc9c8d3ef42e9d2feeef8cf48cfeaaade7f3660300cfe2dc305c49ca0"
  version "0.0.9"

  depends_on "openjdk@21"

  def install
    libexec.install "workload-cli.jar"
    bin.write_jar_script libexec/"workload-cli.jar", "ms-workload", "--enable-native-access=ALL-UNNAMED"
  end
end
