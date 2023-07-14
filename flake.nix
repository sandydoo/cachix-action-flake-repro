{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.05";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachSystem [ "x86_64-linux" "aarch64-linux" ] (system: {
      devShells.default =
        let pkgs = nixpkgs.legacyPackages.${system};
        in pkgs.mkShell {
          packages = [ pkgs.hello ];
        };
    });
}
