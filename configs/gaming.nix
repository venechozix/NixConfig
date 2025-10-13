{ config, pkgs, ... }: {

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



    hardware.opentabletdriver = {
        enable = true;
        daemon.enable = true;
    };

    environment.systemPackages = with pkgs; [
        #gaming
        protonup-qt
        opentabletdriver
        osu-lazer-bin
        gfn-electron
        lutris
        glib
        glib-networking
        dconf
    ];

    nixpkgs.config.permittedInsecurePackages = [
        "electron-35.7.5" #for gfn-electron
    ];

}
