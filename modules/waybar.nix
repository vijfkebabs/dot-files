{ config, pkgs, ... }: {
  home.packages = [ pkgs.waybar ];
  xdg.configFile."waybar".force = true;
  xdg.configFile."waybar".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Documents/dot-files/waybar";
}
