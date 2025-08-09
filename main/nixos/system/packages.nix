{ pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    vim
    greetd # or greetd with unstable chanel
    nautilus
    udisks2
    unzip
  ];
}