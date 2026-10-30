{
  pkgs,
  ...
}:

{
  stylix.enable = true;
  stylix.polarity = "dark";
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/everforest-dark-hard.yaml";

  stylix.fonts.monospace = {
    name = "CaskaydiaCove Nerd Font";
    package = pkgs.nerd-fonts.caskaydia-cove;
  };
  stylix.fonts.sansSerif = {
    name = "CaskaydiaCove Nerd Font";
    package = pkgs.nerd-fonts.caskaydia-cove;
  };
  stylix.fonts.sizes.terminal = 11;

  stylix.targets.console.enable = true;
}
