{ pkgs ? import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/nixos-24.05.tar.gz") {}, compiler ? "ghc961" }:

pkgs.mkShell {
  buildInputs = with pkgs; [ 
    haskell.compiler.ghc961
    which
    (import ./default.nix { inherit pkgs compiler; })
  ];

  shellHook = ''
    __GHCPATH=$(echo $(which ghc))
    echo "ghc_path: $__GHCPATH" > config.yaml 
  '';
}
