#!/usr/bin/env bash
OUT_CONFIGS_DIR="$HOME/.config"

# config dirs setup
for dir in foot sway tofi waybar; do
  src="$dir/"
  dest="$OUT_CONFIGS_DIR/$dir"
  
  cp -R -v "$src" "$OUT_CONFIGS_DIR/"
done


# vimrc move
if [[ -f "vimrc" ]]; then
  mv -f "$HOME/.vimrc" "$HOME/.vimrc.backup"
  cp -v "vimrc" "$HOME/.vimrc"
else
  cp -v "vimrc" "$HOME/.vimrc"
fi

# nix config move
if [[ -f "/etc/nixos/configuration.nix" ]]; then
  sudo cp -v /etc/nixos/configuration.nix /etc/nixos/configuration.nix.backup
  sudo cp -v "conf.nix" /etc/nixos/configuration.nix
else
  sudo cp -v "conf.nix" /etc/nixos/configuration.nix
fi


sudo nixos-rebuild switch

echo "vscode config"

zsh
