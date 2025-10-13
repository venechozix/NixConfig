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
            plugins = [ "git" "thefuck" ];
            theme = "nicoulaj";
        };
    };



    users.users.chozix = {
        isNormalUser = true;
        description = "Jesus";
        extraGroups = [ "networkmanager" "wheel" "syncthing" ];
        packages = with pkgs; [
            kdePackages.kate
            #  thunderbird
        ];
    };

}
