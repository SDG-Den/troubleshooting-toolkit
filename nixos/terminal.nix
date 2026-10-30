{
  pkgs,
  ...
}:

{
  fonts.enableDefaultPackages = false;
  fonts.packages = [ pkgs.nerd-fonts.caskaydia-cove ];

  environment.etc."xdg/foot/foot.ini".text = ''
    [main]
    font=CaskaydiaCove Nerd Font:size=11
    pad=4x4

    [scrollback]
    lines=10000

    [mouse]
    hide-when-typing=no
  '';
}
