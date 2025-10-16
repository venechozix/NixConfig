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
    ];
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
}
