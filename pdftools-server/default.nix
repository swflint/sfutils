{ stdenv, fetchFromGitHub, gcc, gnumake, automake, autoconf, pkgconfig, libpng, zlib, poppler }:

stdenv.mkDerivation rec {

  version = "master-2021-05-18";
  name = "pdftools-server-${version}";

  src = fetchFromGitHub {
    owner = "vedang";
    repo = "pdf-tools";
    rev = "d262cf9e19d57c6567e06e51d109150c20753839";
    sha256 = "0bls4kh7qv5wkjmxizj7rwn2kby0awg1fzkra3fkmg9xbvqzm7qh";
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
