{ config ? null, pkgs, user, stateVersion, ... }:
{
  imports = [
    ./packages.nix
    ./programs/index.nix
  ];

  home = {
    username = user;
    homeDirectory = "/home/${user}";
    stateVersion = stateVersion;
  };

  programs.home-manager.enable = true;
}