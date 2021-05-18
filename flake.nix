{
  description = "Various utilities, packaged.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
    utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, utils }:
    utils.lib.eachDefaultSystem (
      system:
        let
          pkgs = import nixpkgs { inherit system; };
        in
          rec {
            packages = {
              pango-typefaces = pkgs.callPackage ./pango-typefaces {};
            };
            defaultPackage = packages.pango-typefaces;
          }
    );
}
