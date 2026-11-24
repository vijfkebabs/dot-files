{ pkgs, ... }: {
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
  programs.bash = {
    enable = true;
    initExtra = ''
      fastfetch
    '';
  };
}
