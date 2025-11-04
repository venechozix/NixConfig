{ config, pkgs, ... }: {

    services.xserver.enable = true;
    services.xserver.videoDrivers = [ "modesetting" ];

    nixpkgs.config.packageOverrides = pkgs: {
        intel-vaapi-driver = pkgs.intel-vaapi-driver.override { enableHybridCodec = true; };
    };

    environment.systemPackages = with pkgs; [
        vulkan-tools
        vulkan-loader
        vulkan-validation-layers
        bluetui
    ];
    
    
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings = {
        General = {
          # Shows battery charge of connected devices on supported
          # Bluetooth adapters. Defaults to 'false'.
          Experimental = true;
          # When enabled other devices can connect faster to us, however
          # the tradeoff is increased power consumption. Defaults to
          # 'false'.
          FastConnectable = true;
        };
        Policy = {
          # Enable all controllers when they are found. This includes
          # adapters present on start as well as adapters that are plugged
          # in later on. Defaults to 'true'.
          AutoEnable = true;
        };
      };
    };

    hardware.graphics = {
        enable = true;
        extraPackages = with pkgs; [
            mesa
            intel-vaapi-driver
            libvdpau-va-gl
        ];
        extraPackages32 = with pkgs.pkgsi686Linux; [
            mesa
        ];
    };

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
    
    fileSystems."/home/chozix/drives/hdd2" = {
        device = "/dev/disk/by-uuid/628f7e98-4d7f-4c74-a2b2-1c1bf1dafae6"; # replace with your UUID
        fsType = "ext4"; # or whatever lsblk shows
        options = [ "defaults" "nofail" ]; # nofail = don’t break boot if missing
    };

    fileSystems."/mnt/hdd2" = {
        device = "/dev/disk/by-uuid/628f7e98-4d7f-4c74-a2b2-1c1bf1dafae6"; # replace with your UUID
        fsType = "ext4"; # or whatever lsblk shows
        options = [ "defaults" "nofail" ]; # nofail = don’t break boot if missing
    };

}
