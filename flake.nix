{
  description = "dotfiles";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      homeManagerModules = {
        hypr = import ./modules/hypr.nix;
        kitty = import ./modules/kitty.nix;
        rofi = import ./modules/rofi.nix;
	waybar = import ./modules/waybar.nix;
  	waypaper = import ./modules/waypaper.nix;
  	wallust = import ./modules/wallust.nix;
        default = {
          imports = [
            self.homeManagerModules.hypr
            self.homeManagerModules.kitty
            self.homeManagerModules.rofi
	    self.homeManagerModules.waybar
            self.homeManagerModules.waypaper
      	    self.homeManagerModules.wallust
          ];
        };
      };

      homeConfigurations.itlab = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          self.homeManagerModules.default
          {
            home.username = "itlab";
            home.homeDirectory = "/home/itlab";
            home.stateVersion = "25.11"; # set to your NixOS release
          }
        ];
      };
    };
}
