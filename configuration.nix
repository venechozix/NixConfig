{ config, pkgs, ...}:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./configs/hardware.nix

      ./configs/packages.nix
      ./configs/gaming.nix
      ./configs/user.nix
      ./configs/locale.nix
      ./configs/services.nix

      #./configs/kde.nix
      ./configs/niri.nix
    ];

  boot.initrd.kernelModules = [ "amdgpu" ];
  
  hardware.graphics.enable = true;
  services.xserver.enable = true;
  services.xserver.videoDrivers = [ "amdgpu" ];
  boot.kernelParams = [
    "video=DP-1:1280x1024@75.03"
    "video=HDMI-A-1:1366x768@59.73"
  ];
  boot.kernelModules = [ "i2c-dev" ];


  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  networking.networkmanager.enable = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Set your time zone.
  time.timeZone = "America/Montevideo";


    services.greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "niri-session";
          user = "chozix";
        };
      };
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

  nixpkgs.config.allowUnfree = true;


  system.stateVersion = "25.11"; # Did you read the comment?
}
