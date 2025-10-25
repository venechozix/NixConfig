{ config, lib, pkgs, inputs, ...}:

{
    home.username = "chozix";
    home.homeDirectory = "/home/chozix";
    home.stateVersion = "25.05";

    programs.alacritty = {
        enable=true;
        settings = {
            window = {
                decorations = "None";
                padding = {
                    x = 5;
                    y = 5;
                };
            };
        };
    };
    
    programs.neovim = {
        enable = true;

        viAlias=true;
        vimAlias=true;
        extraLuaConfig= lib.fileContents ./nvim/init.lua;
        plugins = with pkgs; [
            vimPlugins.telescope-nvim 
        ];
    };

    programs.git = {
        enable = true;
        settings ={
            init.defaultBranch = "main";
            user.name = "chozix";
            user.email = "venechozix@gmail.com";
        };
    };

    home.pointerCursor = {
        enable = true;
        name = "catppuccin-mocha-dark-cursors";
        package = pkgs.catppuccin-cursors.mochaDark;
        x11.enable = true;
        gtk.enable= true;
        sway.enable = true;
        size = 64;
    };



    home.packages = with pkgs; [
        inputs.zen-browser.packages."${system}".default
        chatterino7
    ];
}
