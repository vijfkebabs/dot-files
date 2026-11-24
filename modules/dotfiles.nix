{ config, lib, pkgs, ... }:
let
  repo = "${config.home.homeDirectory}/Documents/dot-files";
  link = config.lib.file.mkOutOfStoreSymlink;

  xdgLinks = {
    btop = "btop";
    fastfetch = "fastfetch";
    fish = "fish";
    hypr = "hypr";
    kitty = "kitty";
    nvim = "nvim";
    qutebrowser = "qutebrowser";
    rofi = "rofi";
    spicetify = "spicetify";
    swaync = "swaync";
    wallust = "wallust";
    waybar = "waybar";
    waypaper = "waypaper";
    wezterm = "WezTerm";
    windhawk = "windhawk";
    yasb = "yasb";
    yazi = "yazi";
    "Vencord" = "Vencord";
  };
in
{
  home.packages = with pkgs; [
    awww
    btop
    fastfetch
    fish
    kitty
    neovim
    pywalfox-native
    qutebrowser
    rofi
    spotify
    spicetify-cli
    swaynotificationcenter
    vscode
    waybar
    waypaper
    wallust
    wezterm
    yazi
  ];

  fonts.fontconfig.enable = true;

  xdg.configFile = lib.mapAttrs (_name: source:
    {
      force = true;
      inherit source;
    }
  ) (lib.mapAttrs (_name: directory: link "${repo}/${directory}") xdgLinks);

  home.file."Pictures/wallpapers".source = link "${repo}/wallpapers";
  home.file.".config/Code/User/settings.json".source =
    link "${repo}/.vscode/settings.json";

  home.activation.wallustTargets = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    mkdir -p ~/.cache/wallust ~/.cache/wal \
             ~/.config/waybar/wallust \
             ~/.config/btop/themes \
             ~/.config/Vencord/themes \
             ~/.config/spicetify/Themes/wallust
  '';
}
