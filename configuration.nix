{ config, pkgs, ... }:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./configs/hardware.nix

    ./configs/packages.nix
    ./configs/gaming.nix
    ./configs/user.nix
    ./configs/locale.nix
    ./configs/services.nix

    ./configs/niri.nix
  ];

  boot.kernelPackages = pkgs.pkgs.linuxPackages_6_12;

  boot.initrd.kernelModules = [ "amdgpu" ];

  hardware.graphics.enable = true;
  services.xserver.enable = true;
  services.xserver.videoDrivers = [ "amdgpu" ];
  boot.kernelModules = [ "i2c-dev" ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  networking.networkmanager.enable = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Set your time zone.
  time.timeZone = "America/Montevideo";

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time --remember --cmd niri-session";
        user = "greeter";
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

    wireplumber.extraConfig."10-disable-agc" = {
      "monitor.alsa.properties" = {
        "capture.auto_gain_control" = false;
      };
    };

    extraConfig.pipewire."92-low-latency" = {
      "context.properties" = {
        "default.clock.rate" = 48000;
        "default.clock.quantum" = 32;
        "default.clock.min-quantum" = 32;
        "default.clock.max-quantum" = 32;
      };
    };
  };

  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "25.11"; # Did you read the comment?
}
