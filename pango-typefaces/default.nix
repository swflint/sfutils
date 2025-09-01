{ stdenv, pkg-config, pango, cairo }:

stdenv.mkDerivation rec {

  name = "pango-typefaces";

  unpackPhase = ":";

  buildInputs = [
    pkg-config
    pango
    cairo
  ];

  installPhase = ''
    mkdir -p $out/bin
    gcc -o $out/bin/pango-typefaces \
        -Wall \
        -g ${./pango-typefaces.c} \
        `pkg-config --cflags --libs pango` \
        `pkg-config --cflags --libs cairo` \
        `pkg-config --cflags --libs pangocairo` \
        `pkg-config --cflags --libs glib-2.0`
  '';

}
