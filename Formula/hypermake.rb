class Hypermake < Formula
    desc "A parameterized workflow manager"
    homepage "https://tongfei.me/hypermake"
    head "https://github.com/ctongfei/hypermake.git", branch: "main"
    license "MIT"
    version "0.1.0"

    depends_on "openjdk"
    depends_on "sbt" => :build
    
    def install
        system "sbt", "assembly"
        system "mkdir", "-p", "#{lib}/hypermake"
        lib.install "target/scala-2.13/hypermake-assembly-0.1.0.jar" => "hypermake/hypermake.jar"
        share.install "src/main/hypermake" => "hypermake"
        bin.install "bin/hypermake" => "hypermake"
        system "chmod", "+x", "#{bin}/hypermake"
    end

    test do
        system "#{bin}/hypermake", "--version"
    end
end
