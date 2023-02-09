{ stdenv, fetchFromGitHub, gcc, gnumake, automake, autoconf, pkgconfig, libpng, zlib, poppler }:

stdenv.mkDerivation rec {

  version = "master-2023-02-29";
  name = "pdftools-server-${version}";

  src = fetchFromGitHub {
    owner = "vedang";
    repo = "pdf-tools";
    rev = "bc2ba117e8c3196ff9adf0da4fa1e63a8da3d7c8";
    sha256 = "sha256-ed/QqTjsx2xRIAhNv63tMYHuqOplPFODmATu/MsX4+w=";
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
