{ buildGo126Module, fetchFromGitHub, lib }:

buildGo126Module rec {
  pname = "gwq";
  version = "0.0.17";

  src = fetchFromGitHub {
    owner = "d-kuro";
    repo = "gwq";
    rev = "01a8aa12e36a6ca3c569d3d56bc10883a59e0ff4";
    hash = "sha256-A7CUzLhhjKRhiL88l8j3xCmKrRDk+KOhdbaow8FAlCo=";
  };

  vendorHash = "sha256-4K01Xf1EXl/NVX1loQ76l1bW8QglBAQdvlZSo7J4NPI=";

  subPackages = [ "cmd/gwq" ];

  ldflags = [
    "-s"
    "-w"
    "-X main.version=v${version}"
  ];

  env.CGO_ENABLED = 0;
  meta = with lib; {
    description = "Git worktree manager with fuzzy finder";
    homepage = "https://github.com/d-kuro/gwq";
    license = licenses.asl20;
    mainProgram = "gwq";
    platforms = platforms.unix;
  };
}
