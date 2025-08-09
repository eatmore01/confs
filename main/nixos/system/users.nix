{
  users.users.etm = {
    isNormalUser = true;
    description = "etm";
    extraGroups = [ "networkmanager" "wheel" "storage" "plugdev" "docker"];
    home = "/home/etm";
  };
}