{ pkgs, ... }: {
  home.packages = with pkgs; [
    waypaper
    awww   # backend; swap for hyprpaper or swaybg if your waypaper config uses another
  ];
}
