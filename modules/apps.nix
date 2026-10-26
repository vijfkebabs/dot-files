{ config, lib, pkgs, ... }:
let
  repo = "${config.home.homeDirectory}/Documents/dot-files";
  link = config.lib.file.mkOutOfStoreSymlink;
in {
  home.packages = with pkgs; [
    swaynotificationcenter
    btop
    fastfetch
    vscode
    (discord.override { withVencord = true; })
    spotify
    spicetify-cli
    pywalfox-native
    nerd-fonts.jetbrains-mono
  ];

  fonts.fontconfig.enable = true;

  xdg.configFile."swaync" = {
    force = true;
    source = link "${repo}/swaync";
  };
  xdg.configFile."fastfetch" = {
    force = true;
    source = link "${repo}/fastfetch";
  };
  programs.bash = {
  enable = true;
  initExtra = ''
    fastfetch
  '';
  };

  home.activation.wallustTargets = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    mkdir -p ~/.cache/wallust ~/.cache/wal \
             ~/.config/waybar/wallust \
             ~/.config/btop/themes \
             ~/.config/Vencord/themes \
             ~/.config/spicetify/Themes/wallust
  '';
}
