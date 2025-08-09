# NIXOS

```bash
sudo mv "/etc/nixos/hardware-configuration.nix" /tmp/hardware-configuration.nix
sudo rm -rf /etc/nixos/*
sudo cp -R ./main/* /etc/nixos/
sudo mv /tmp/hardware-configuration.nix "/etc/nixos/hardware-configuration.nix"


sudo nixos-rebuild switch --flake /etc/nixos
```

- recreate hardware-configuration.nix and configuration.nix 
```bash
sudo nixos-generate-config
```