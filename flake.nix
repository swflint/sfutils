{
  description = "Various utilities, packaged.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
    utils.url = "github:numtide/flake-utils";
    plover-flake.url = "github:dnaq/plover-flake";
  };

  outputs = { self, nixpkgs, utils, plover-flake }:
    utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs { inherit system; };
        plover-pkgs = plover-flake.packages.${system};
      in
      rec {
        packages = {
          pango-typefaces = pkgs.callPackage ./pango-typefaces { };
          pdftools-server = pkgs.callPackage ./pdftools-server { };
          usbscale = pkgs.callPackage ./usbscale { };
          sctools = pkgs.callPackage ./sctools { };
          dbus-listen = pkgs.callPackage ./dbus-listen { };
          external-editor-revived = pkgs.callPackage ./external-editor-revived { };
          my_plover = plover-pkgs.plover.with-plugins (ps: with ps; [
            plover_auto_reconnect_machine
            plover_console_ui
            plover_python_dictionary
          ]);
        };
        defaultPackage = packages.pango-typefaces;
      }
    );
}
