{ config, pkgs, ... }: {

    services.xserver.videoDrivers = [ "modesetting" ];

    hardware.opengl.enable = true;

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
}
