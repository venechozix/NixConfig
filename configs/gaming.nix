{ config, pkgs, inputs, aagl, ... }: {

    
    #Steam
    programs.steam = {
        enable = true;
        remotePlay.openFirewall = true;
        dedicatedServer.openFirewall = true;
        extraCompatPackages =  with pkgs; [
            proton-ge-bin
        ];
        protontricks.enable = true;
    };

    nix.settings = aagl.nixConfig;
        
    programs.sleepy-launcher.enable = true;

    programs.appimage.enable = true;
    programs.appimage.binfmt = true;

    hardware.opentabletdriver = {
        enable = true;
        daemon.enable = true;
    };

    environment.systemPackages = with pkgs; [
        #gaming
        protonup-qt
        opentabletdriver
        osu-lazer-bin
        lutris
        heroic-unwrapped
        glib
        glib-networking
        dconf
    ];

}
