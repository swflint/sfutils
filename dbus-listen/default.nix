{ haskellPackages }:

haskellPackages.callCabal2nix "dbus-listen" ./. { }
