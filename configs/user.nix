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
            remove = "sudo nix-collect-garbage -d && sudo nix-env --profile /nix/var/nix/profiles/system --delete-generations +2";
        };
        histSize = 1000;
        ohMyZsh = { # "ohMyZsh" without Home Manager
            enable = true;
            plugins = [ "git" ];
            theme = "nicoulaj";
        };
    };

           

    users.users.chozix = {
        isNormalUser = true;
        description = "Jesus";
        extraGroups = [ "networkmanager" "wheel" "syncthing" "docker" ];
        packages = with pkgs; [
            exfatprogs
            gparted
            exfat
            obsidian
        ];
    };

}
