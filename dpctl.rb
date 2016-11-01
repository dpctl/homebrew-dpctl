require "formula"

class Dpctl < Formula
  desc "DataPower Control tool"
  homepage "http://dpctl.org"
  url "https://github.com/dpctl/dpctl/releases/download/v0.2.1/dpctl-standalone-0.2.1.jar"
  version "0.2.1"
  sha256 ""

  bottle :unneeded

  head do
    url "https://github.com/dpctl/dpctl.git"
    depends_on "leiningen" => :build
  end

  depends_on :java => "1.8+"

  def install
    if build.head?
      system "lein", "uberjar"
      dpctl_jar = Dir["target/dpctl-standalone-*.jar"][0]
    else
      dpctl_jar = "dpctl-standalone-" + version + ".jar"
    end

    libexec.install dpctl_jar
    bin.write_jar_script libexec/File.basename(dpctl_jar), "dpctl"
  end

  test do
  end
end
