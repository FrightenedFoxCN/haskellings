{ pkgs ? import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/nixos-24.05.tar.gz") {}, compiler ? "ghc961" }:
pkgs.haskell.packages.${compiler}.callPackage ./haskellings.nix { }
