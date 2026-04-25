{
  inputs.nixpkgs-2511.url = "github:NixOS/nixpkgs/release-25.11";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  inputs.nixpkgs-master.url = "github:NixOS/nixpkgs";
  inputs.disko.url = "github:nix-community/disko";
  inputs.disko.inputs.nixpkgs.follows = "nixpkgs";

  outputs =
    {
      nixpkgs-2511,
      nixpkgs,
      nixpkgs-master,
      disko,
      ...
    }:
    {
      nixosConfigurations.legion = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          {
            nixpkgs.overlays = [
              (final: prev: {
                pkgs-2511 = import nixpkgs-2511 {
                  inherit (final.stdenv.hostPlatform) system;
                };
                master = import nixpkgs-master {
                  inherit (final) config;
                  inherit (final.stdenv.hostPlatform) system;
                };
              })
            ];
          }
          ./machines/legion/default.nix
        ];
      };

      nixosConfigurations.aliyun = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          disko.nixosModules.disko
          ./machines/aliyun/configuration.nix
        ];
      };
    };
}
