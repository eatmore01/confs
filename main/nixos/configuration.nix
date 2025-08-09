{ config, pkgs, lib, hostname, stateVersion, home-manager, ... }:
{
  imports =
    [
      ./hardware-configuration.nix
      ./system/index.nix
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = stateVersion;

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        # greetd.tuigreet -> tuigreet in unstable packages
        command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd sway";
        user = "greeter";
      };
    };
  };

  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    extraPackages = with pkgs; [
      swaylock
      swayidle
      waybar
      wl-clipboard
      wf-recorder
      mako
      grim
      slurp
      tofi
    ];
  };
  
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-wlr
    ];
  };
}
