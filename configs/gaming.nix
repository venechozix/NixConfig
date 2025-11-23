{ config, pkgs, inputs, ... }: {

    nixpkgs.overlays = [
      (final: prev: {
        gfn-electron = (import inputs.oldpkgs {
          system = pkgs.stdenv.hostPlatform.system;
          config.permittedInsecurePackages = [ "electron-35.7.5" ];
        }).gfn-electron;
      })
    ];

    
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
        gfn-electron
        lutris
        heroic-unwrapped
        glib
        glib-networking
        dconf
    ];

}
