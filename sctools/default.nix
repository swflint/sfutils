{ stdenv, fetchFromGitHub, autoreconfHook, hidapi }:

stdenv.mkDerivation rec {
  version = "master-2021-10-22";
  name = "sctools-${version}";

  src = fetchFromGitHub {
    owner = "thentenaar";
    repo = "sctools";
    rev = "7e3b7d2031dec4f11bb6995e07b23bedc7dbc942";
    sha256 = "01q3mmw7aclig7pz81kpd3n7v7lz9j7s4x86606gqy96fapmn0gy";
    fetchSubmodules = false;
  };

  nativeBuildInputs = [ autoreconfHook hidapi ];

}
