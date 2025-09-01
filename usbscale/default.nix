{ stdenv, fetchFromGitHub, libusb1 }:

stdenv.mkDerivation rec {
  version = "master-2021-06-13";
  name = "usbscale-${version}";

  src = fetchFromGitHub {
    owner = "erjiang";
    repo = "usbscale";
    rev = "4b9175988998121dbb835db36926dec3f4b09c93";
    sha256 = "02r8yr9ag7vf8fv9pvq7l7dm0limclfhaakchsggwhmchxprwi6p";
    fetchSubmodules = false;
  };

  buildInputs = [ libusb1 ];

  installPhase = ''
    mkdir -p $out/bin
    cp -p usbscale $out/bin
  '';
}
