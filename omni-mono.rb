class OmniMono < Formula
#   brew tap  akrisiun/aliases
#   brew i akrisiun/aliases/omni-mono

    desc "Cross platform .NET development in the editor of your choice"
    homepage "http://www.omnisharp.net/"
    url "https://github.com/OmniSharp/omnisharp-roslyn/releases/download/v1.27.2/omnisharp.http-mono.tar.gz"
    version "1.27.2"
    sha256 "22c65610d4bd797bb532d45c3a2366b79d445563e9f8f5bba4208938268f9d29"
    # conflicts_with "omnisharp"
    depends_on "mono" => :recommended
  
    def install
      libexec.install Dir["*"]
  
      # To match non-mono install, create an `omnisharp' shell script.
      (bin/"omnisharp").write <<-EOS.undent
        #!/usr/bin/env sh
        mono /usr/local/opt/omnisharp-mono/libexec/OmniSharp.exe $@
      EOS
    end
  
    def post_install
      system "/bin/chmod +x #{bin}/omnisharp"
    end
end
