{ config, pkgs, ... }: {
  home.packages = [ pkgs.wallust ];
  xdg.configFile."wallust".force = true;
  xdg.configFile."wallust".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Documents/dot-files/wallust";
}
