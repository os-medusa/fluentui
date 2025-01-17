{
  description = "A Fluent Design component library for Qt QML";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, ... }@inputs: inputs.utils.lib.eachSystem [
    "x86_64-linux"
  ] (system: let
    pkgs = import nixpkgs {
      inherit system;
    };
  in rec {
    packages.default = pkgs.kdePackages.callPackage ./package.nix { };

    devShells.default = pkgs.mkShell {
      inputsFrom = [ packages.default ];
    };
  });
}
