{ fetchzip, lib, stdenvNoCC }:

stdenvNoCC.mkDerivation rec {
  pname = "kotlin-lsp";
  version = "262.2310.0";

  src = fetchzip {
    url = "https://download-cdn.jetbrains.com/kotlin-lsp/${version}/kotlin-lsp-${version}-linux-x64.zip";
    hash = "sha256-Bf2qkFpNhQC/Mz563OapmCXeKN+dTrYyQbOcF6z6b48=";
    stripRoot = false;
  };

  installPhase = ''
    runHook preInstall

    mkdir -p $out/bin $out/share/kotlin-lsp
    cp -r ./* $out/share/kotlin-lsp/
    chmod +x $out/share/kotlin-lsp/kotlin-lsp.sh
    ln -s $out/share/kotlin-lsp/kotlin-lsp.sh $out/bin/kotlin-lsp

    runHook postInstall
  '';

  meta = with lib; {
    description = "JetBrains Kotlin language server standalone distribution";
    homepage = "https://github.com/Kotlin/kotlin-lsp";
    license = licenses.asl20;
    mainProgram = "kotlin-lsp";
    platforms = [ "x86_64-linux" ];
    sourceProvenance = with sourceTypes; [ binaryBytecode ];
  };
}
