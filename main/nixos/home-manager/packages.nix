{ config, pkgs, ...}:
{
  home.packages = with pkgs; [
    htop
    google-chrome
    telegram-desktop
    dnsutils
    file
    vscode
    pavucontrol
    discord
    kubectl
    kubernetes-helm
    terraform
    k9s
    terragrunt
    terraform-docs
    helm-docs
    fastfetch
  ];
}