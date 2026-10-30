{
  config,
  lib,
  pkgs,
  ...
}:

let
  colors = config.lib.stylix.colors.withHashtag;
  lyColor = name: "0x" + builtins.substring 1 6 colors.${name};
in

{
  users.users.toolkit = {
    isNormalUser = true;
    description = "Troubleshooting Toolkit";
    initialHashedPassword = "";
    extraGroups = [
      "audio"
      "disk"
      "input"
      "networkmanager"
      "render"
      "video"
      "wheel"
    ];
    shell = pkgs.zsh;
  };

  users.users.root.initialHashedPassword = lib.mkForce "";
  users.users.nixos.initialHashedPassword = lib.mkForce "!";

  security.sudo.wheelNeedsPassword = lib.mkForce false;
  security.pam.services.login.allowNullPassword = true;
  security.polkit.enable = true;
  security.polkit.extraConfig = ''
    polkit.addRule(function(action, subject) {
      if (subject.isInGroup("wheel") &&
          (action.id == "org.freedesktop.login1.power-off" ||
           action.id == "org.freedesktop.login1.reboot" ||
           action.id == "org.freedesktop.login1.power-off-multiple-sessions" ||
           action.id == "org.freedesktop.login1.reboot-multiple-sessions")) {
        return polkit.Result.YES;
      }
    });
  '';

  services.getty.autologinUser = lib.mkForce "toolkit";

  services.getty.helpLine = lib.mkForce ''
    The "toolkit" and "root" accounts have empty passwords.
    The "toolkit" account has passwordless sudo.
    The "nixos" account is locked.

    To log in over ssh, set a password for "toolkit" with `passwd` first.
    To set up a wireless connection, run `nmtui`.
  '';

  services.displayManager = {
    enable = true;
    defaultSession = "toolkit";
    hiddenUsers = [
      "nixos"
      "root"
    ];

    ly = {
      enable = true;
      x11Support = false;
      settings = {
        fg = lyColor "base05";
        bg = lyColor "base00";
        border_fg = lyColor "base03";
        error_fg = lyColor "base08";
        error_bg = lyColor "base00";
      };
    };
  };
}
