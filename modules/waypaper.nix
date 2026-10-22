{ config, pkgs, ... }: {
  home.packages = with pkgs; [
    waypaper
    awww   # backend; swap for hyprpaper or swaybg if your waypaper config uses another
  ];
  xdg.configFile."waypaper".force = true;
  xdg.configFile."waypaper".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Documents/dot-files/waypaper";
}
