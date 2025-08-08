{
  # for sway
  services.gnome.gnome-keyring.enable = true;

  # support detect new device ( usb, etc. )
  services.gvfs.enable = true;
  systemd.user.services.gvfs-udisks2-volume-monitor = {
    enable = true;
  };

  services.xserver.enable = false;
}