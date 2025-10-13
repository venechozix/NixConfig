{ config, pkgs, ... }: {


    programs.zsh.enable = true;

    fonts.packages = with pkgs; [
        jetbrains-mono
        font-awesome
        nerd-fonts.jetbrains-mono
    ];

    fonts.fontconfig.enable = true;

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
        rar
        unrar
        kdePackages.dolphin
        wine
    ];


}


