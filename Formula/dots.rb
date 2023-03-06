class Dots < Formula
  desc "A command line tool for managing my dotfiles"
  homepage "https://github.com/m-housh/dots"
  url "https://github.com/m-housh/dots.git", branch: "main"
  sha256 "0af03cf512e2e49ffa74bb6ac69ebd8c622504255d5f33cf7ee4da93448dce6e"
  license "MIT"
  version "0.0.1"

  depends_on xcode: ["12", :build]

  def install
    system "make", "install", "PREFIX=#{prefix}"
    (bash_completion/"dots").write `#{bin}/dots --generate-completion-script bash`
    (fish_completion/"dots.fish").write `#{bin}/dots --generate-completion-script fish`
    (zsh_completion/"dots").write `#{bin}/dots --generate-completion-script zsh`
  end

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_ventura: "0af03cf512e2e49ffa74bb6ac69ebd8c622504255d5f33cf7ee4da93448dce6e"
  end

  test do
    system "#{bin}/dots" "--version"
  end
end
