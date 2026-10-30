{
  lib,
  ...
}:

{
  imports = [
    ./hardware.nix
    ./boot.nix
    ./minimal.nix
    ./users.nix
    ./theme.nix
    ./shell.nix
    ./session.nix
    ./terminal.nix
    ./network.nix
    ./tools.nix
  ];

  system.stateVersion = lib.trivial.release;

  networking.hostName = "toolkit";
  time.timeZone = "UTC";

  system.nixos.distroName = "Troubleshooting Toolkit";
  system.nixos.distroId = "troubleshooting-toolkit";

  nixpkgs.config.allowUnfree = true;

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.toolkit = import ../home/toolkit.nix;
  };
}
