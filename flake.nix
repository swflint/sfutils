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
          pango-typefaces = pkgs.callPackage ./pango-typefaces { };
          pdftools-server = pkgs.callPackage ./pdftools-server { };
          usbscale = pkgs.callPackage ./usbscale { };
          sctools = pkgs.callPackage ./sctools { };
          dbus-listen = pkgs.callPackage ./dbus-listen { };
        };
        defaultPackage = packages.pango-typefaces;
      }
    );
}
