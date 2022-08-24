{ stdenv, fetchFromGitHub, gcc, gnumake, automake, autoconf, pkgconfig, libpng, zlib, poppler }:

stdenv.mkDerivation rec {

  version = "master-2021-05-18";
  name = "pdftools-server-${version}";

  src = fetchFromGitHub {
    owner = "vedang";
    repo = "pdf-tools";
    rev = "1a0a30c54dc3effdba4781a2983115d4b6993260";
    sha256 = "1gy7d25iplix02h9kqxxvfrxfwr2gm11xdmmx9ckbj3q51b5gi1r";
    fetchSubmodules = false;
  };

  buildInputs = [
    gcc
    gnumake
    automake
    autoconf
    pkgconfig
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
