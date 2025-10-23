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

    programs.neovim{
        enable = true;
        viAlias = true;
        vimAlias = true;

        extraConfig = ''
            set number
            syntax on
            set expandtab
            set tabstop=4
            set softtabstop=4
            set shiftwidth=4
        '';

        plugins = with pkgs.vimPlugins; [
            telescope-nvim
            nvim-treesitter
            nvim-lspconfig
            gruvbox-nvim
        ];
    };
           

    users.users.chozix = {
        isNormalUser = true;
        description = "Jesus";
        extraGroups = [ "networkmanager" "wheel" "syncthing" "docker" ];
        packages = with pkgs; [
            exfatprogs
            gparted
            exfat
        ];
    };

}
