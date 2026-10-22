# modules/hypr.nix
{ config, ... }: {
  xdg.configFile."hypr".force = true;
  xdg.configFile."hypr".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Documents/dot-files/hypr";
}
