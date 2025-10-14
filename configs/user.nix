{ config, pkgs, ... }: {

    users.defaultUserShell = pkgs.zsh;
    
    programs.zsh = {
        enable = true;
        enableCompletion = true;
        autosuggestions.enable = true;
        syntaxHighlighting.enable = true;

        shellAliases = {
            ll = "ls -l";
            update = "sudo nixos-rebuild switch --flake ~/NixConfig/";
        };
        histSize = 1000;
        ohMyZsh = { # "ohMyZsh" without Home Manager
            enable = true;
            plugins = [ "git" ];
            theme = "nicoulaj";
        };
    };

    nixpkgs.config.permittedInsecurePackages = [
                "libsoup-2.74.3"
    ];

    users.users.chozix = {
        isNormalUser = true;
        description = "Jesus";
        extraGroups = [ "networkmanager" "wheel" "syncthing" ];
        packages = with pkgs; [
            exfatprogs
            gparted
            exfat
            sonobus
        ];
    };

}
