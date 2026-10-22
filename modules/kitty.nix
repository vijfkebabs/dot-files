# modules/kitty.nix
{ config, pkgs, ... }: {
  home.packages = [ pkgs.kitty ];
  xdg.configFile."kitty".force = true;
  xdg.configFile."kitty".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Documents/dot-files/kitty";
}
