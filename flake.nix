{
  description = "dotfiles";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    areofyl-fetch.url = "github:areofyl/fetch";
  };

  outputs = { self, nixpkgs, home-manager, areofyl-fetch, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;   # vscode, discord, spotify
      };
    in {
      homeManagerModules = {
        hypr = import ./modules/hypr.nix;
        kitty = import ./modules/kitty.nix;
        rofi = import ./modules/rofi.nix;
        waybar = import ./modules/waybar.nix;
        waypaper = import ./modules/waypaper.nix;
        wallust = import ./modules/wallust.nix;
        apps = import ./modules/apps.nix;
        default = {
          imports = [
            self.homeManagerModules.hypr
            self.homeManagerModules.kitty
            self.homeManagerModules.rofi
            self.homeManagerModules.waybar
            self.homeManagerModules.waypaper
            self.homeManagerModules.wallust
            self.homeManagerModules.apps
          ];
        };
      };

      homeConfigurations.itlab = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          self.homeManagerModules.default
          areofyl-fetch.homeManagerModules.default
          {
            home.username = "itlab";
            home.homeDirectory = "/home/itlab";
            home.stateVersion = "25.11"; # set to your NixOS release
            programs.home-manager.enable = true;
            programs.fetch.enable = true;
          }
        ];
      };
    };
}