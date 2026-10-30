{
  lib,
  modulesPath,
  ...
}:

{
  imports = [
    (modulesPath + "/installer/cd-dvd/installation-cd-minimal.nix")
  ];

  documentation.enable = lib.mkForce false;
  documentation.man.enable = lib.mkForce false;
  documentation.doc.enable = lib.mkForce false;
  documentation.info.enable = lib.mkForce false;
  documentation.nixos.enable = lib.mkForce false;

  environment.defaultPackages = lib.mkForce [ ];

  fonts.fontconfig.enable = lib.mkForce true;

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.supportedLocales = [ "en_US.UTF-8/UTF-8" ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  nix.settings.trusted-users = lib.mkForce [ "toolkit" ];

  services.logrotate.enable = false;
  services.speechd.enable = lib.mkForce false;
  programs.command-not-found.enable = false;
  programs.git.enable = lib.mkForce false;
}
