{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  time.timeZone = "Asia/Irkutsk";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ru_RU.UTF-8";
    LC_IDENTIFICATION = "ru_RU.UTF-8";
    LC_MEASUREMENT = "ru_RU.UTF-8";
    LC_MONETARY = "ru_RU.UTF-8";
    LC_NAME = "ru_RU.UTF-8";
    LC_NUMERIC = "ru_RU.UTF-8";
    LC_PAPER = "ru_RU.UTF-8";
    LC_TELEPHONE = "ru_RU.UTF-8";
    LC_TIME = "ru_RU.UTF-8";
  };


  users.users.etm = {
    isNormalUser = true;
    description = "etm";
    extraGroups = [ "networkmanager" "wheel" "storage" "plugdev" "docker"];
    shell = pkgs.zsh;
    packages = with pkgs; [
    #  thunderbird
    ];
  };

  services.xserver.enable = false;
  environment.systemPackages = with pkgs; [
    vim
    google-chrome
    telegram-desktop
    zsh
    file
    mako
    greetd.greetd
    fastfetch
    nautilus
    git
    udisks2
    unzip
    waybar
    amnezia-vpn
    vscode
    pavucontrol
    docker
    discord
    kubectl
    kubernetes-helm
    terraform
    k9s
    terragrunt
    terraform-docs
    helm-docs
  ];

  virtualisation.docker.enable = true;

  # start needed amneziavpn service
  programs.amnezia-vpn.enable = true;

  services.gvfs.enable = true;
  systemd.user.services.gvfs-udisks2-volume-monitor = {
    enable = true;
  };

  # greetd login manager
  services.greetd = {                                                      
    enable = true;                                                         
    settings = {                                                           
      default_session = {                                                  
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd sway";
        user = "greeter";                                                  
      };                                                                   
    };                                                                     
  };

  # sway
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    extraPackages = with pkgs; [
      swaylock
      swayidle
      wl-clipboard
      wf-recorder
      mako
      grim     
      slurp
      foot
      tofi
    ];
  };

  # zsh
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;

    shellInit = ''
      export KUBECONFIGS="?"
    '';

    shellAliases = {
      # kube
      ktx = "kubectx";
      k = "kubectl";
      h = "helm";
      ks = "kubeswitches";
      # docker
      d = "docker";
      dc = "docker compose";
      # tf tg
      tf = "terraform";
      tg = "terragrunt";
      # git alias
      commit = "git add . && git commit -am";
      push = "git push origin";
      pullreb = "git pull origin --rebase";
      # other
      v = "vault";
      gen_tf_doc = "terraform-docs markdown table --output-file README.md --output-mode inject";
      hd = "helm-docs";
    };

    ohMyZsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "robbyrussell"; 
    };
  };

  programs.firefox.enable = true;
  nixpkgs.config.allowUnfree = true;
  # for sway
  services.gnome.gnome-keyring.enable = true;
  services.printing.enable = true;
  # audio
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  system.stateVersion = "25.05";
}
