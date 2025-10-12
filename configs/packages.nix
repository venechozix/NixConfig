{ config, pkgs, ... }: {

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
    ];


}


