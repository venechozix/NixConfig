{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./desktops/plasma.nix
      ./desktops/niri.nix
    ];


  fileSystems."/mnt/hdd1" = {
    device = "/dev/disk/by-uuid/39f08c2e-6b56-48d2-bf1b-2010b3983340"; # replace with your UUID
    fsType = "ext4"; # or whatever lsblk shows
    options = [ "defaults" "nofail" ]; # nofail = don’t break boot if missing
  };

  fileSystems."/home/chozix/drives/hdd1" = {
    device = "/dev/disk/by-uuid/39f08c2e-6b56-48d2-bf1b-2010b3983340"; # replace with your UUID
    fsType = "ext4"; # or whatever lsblk shows
    options = [ "defaults" "nofail" ]; # nofail = don’t break boot if missing
  };

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  networking.networkmanager.enable = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Set your time zone.
  time.timeZone = "America/Montevideo";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "es_UY.UTF-8";
    LC_IDENTIFICATION = "es_UY.UTF-8";
    LC_MEASUREMENT = "es_UY.UTF-8";
    LC_MONETARY = "es_UY.UTF-8";
    LC_NAME = "es_UY.UTF-8";
    LC_NUMERIC = "es_UY.UTF-8";
    LC_PAPER = "es_UY.UTF-8";
    LC_TELEPHONE = "es_UY.UTF-8";
    LC_TIME = "es_UY.UTF-8";
  };

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;

  # Enable sddm
  services.displayManager.sddm.enable = true;


  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };


  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  
  };

  #Steam
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    extraCompatPackages =  with pkgs; [
      proton-ge-bin
    ];
  };



  hardware.opentabletdriver = {
    enable = true;
    daemon.enable = true;
  };

  #Syncthing
  services = {
    syncthing = {
        enable = true;
        group = "syncthing";
        user = "chozix";
        dataDir = "/home/chozix/";    # Default folder for new synced folders
        configDir = "/home/chozix/.config/syncthing";   # Folder for Syncthing's settings and keys
    };
};



  users.users.chozix = {
    isNormalUser = true;
    description = "Jesus";
    extraGroups = [ "networkmanager" "wheel" "syncthing" ];
    packages = with pkgs; [
      kdePackages.kate
    #  thunderbird
    ];
  };




  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    #dev
    vim
    wget
    alacritty
    xclip
    bat
    tealdeer
    #school
    ciscoPacketTracer8
    #utils
    vesktop
    keepassxc
    #gaming
    protonup-qt
    opentabletdriver
  ];



  system.stateVersion = "25.05"; # Did you read the comment?

}
