{ rustPlatform
, fetchFromGitHub
}:

rustPlatform.buildRustPackage rec {
  name = "external-editor-revived";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "Frederick888";
    repo = "external-editor-revived";
    rev = "refs/tags/v${version}";
    hash = "sha256-ix3NrNAQmZl2v66MBH5zFsz7+7muRP2RBvbJ9i+VYwo=";
  };
  cargoSha256 = "sha256-3joBgLXWMD8HTI9iiygX9B9pYinIbTtzfeX2zOz7Q3w=";
}
