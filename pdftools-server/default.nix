{ stdenv, fetchFromGitHub, gcc, gnumake, automake, autoconf, pkg-config, libpng, zlib, poppler }:

stdenv.mkDerivation rec {

  version = "master-2023-02-29";
  name = "pdftools-server-${version}";

  src = fetchFromGitHub {
    owner = "vedang";
    repo = "pdf-tools";
    rev = "30b50544e55b8dbf683c2d932d5c33ac73323a16";
    sha256 = "sha256-/UH3KcuZf9p7MA0ZzhqAgTv6LjKnBXHfJUOdIxV6KbI=";
    fetchSubmodules = false;
  };

  buildInputs = [
    gcc
    gnumake
    automake
    autoconf
    pkg-config
    libpng
    zlib
    poppler
  ];

  preConfigure = ''
    cd server
    ./autogen.sh
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp -p epdfinfo $out/bin
  '';
}
