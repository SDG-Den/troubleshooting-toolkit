{
  description = "Minimal NixOS live ISO for device and server troubleshooting";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{ self, nixpkgs, ... }:
    let
      system = "x86_64-linux";
      toolkit = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./nixos/default.nix
          inputs.home-manager.nixosModules.home-manager
          inputs.stylix.nixosModules.stylix
        ];
      };
    in
    {
      nixosConfigurations.toolkit = toolkit;

      packages.${system} = {
        iso = toolkit.config.system.build.isoImage;
        default = self.packages.${system}.iso;
      };

      checks.${system}.ly-config =
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        pkgs.runCommand "check-ly-config" {
          nativeBuildInputs = [ (pkgs.ly.override { x11Support = false; }) ];
        } ''
          ly --validate-config ${toolkit.config.environment.etc."ly/config.ini".source}
          touch $out
        '';
    };
}
