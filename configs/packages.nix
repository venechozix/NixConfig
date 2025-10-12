{ config, pkgs, ... }: {


    programs.zsh.enable = true;

    fonts.packages = with pkgs; [
        jetbrains-mono
        nerdfonts
    ];

    environment.systemPackages = with pkgs; [
        #dev
        vim
        wget
        alacritty
        xclip
        bat
        tealdeer
        neovim
        #school
        ciscoPacketTracer8
        #utils
        vesktop
        keepassxc
        zip
        unzip
    ];


}


