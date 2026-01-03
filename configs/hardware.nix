{ config, pkgs, ... }: {

    services.hardware.openrgb.enable = true;

    environment.systemPackages = with pkgs; [
        vulkan-tools
        vulkan-loader
        vulkan-validation-layers
        bluetui
        mangohud
        goverlay
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

    fileSystems."/mnt/hdd1" = {
        device = "/dev/disk/by-uuid/77808b26-1409-4691-aee6-9f506fe02e9c"; # replace with your UUID
        fsType = "ext4"; # or whatever lsblk shows
        options = [ "defaults" "nofail" ]; # nofail = don’t break boot if missing
    };

    fileSystems."/home/chozix/drives/hdd1" = {
        device = "/dev/disk/by-uuid/77808b26-1409-4691-aee6-9f506fe02e9c"; # replace with your UUID
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
