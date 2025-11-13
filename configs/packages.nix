{ config, pkgs, ... }: {


    programs.zsh.enable = true;

    fonts.packages = with pkgs; [
        jetbrains-mono
        font-awesome
        nerd-fonts.jetbrains-mono
    ];

    fonts.fontconfig.enable = true;

    virtualisation.docker = {
        enable=true;    
    };

    

    environment.systemPackages = with pkgs; [
        #dev
        libgccjit
        android-studio
        vim
        wget
        alacritty
        xclip
        bat
        tealdeer
        lua
        binutils
        gnumake
        glibc
        python313
        python314
        pyenv
        python3Packages.sounddevice
        vscodium
        #utils
        readest
        icu77
        zoom-us
        pavucontrol
        fastfetch
        spotify
        vesktop
        keepassxc
        zip
        unzip
        rar
        unrar
        p7zip
        kdePackages.dolphin
        wine
        winetricks
        wine64Packages.waylandFull
        obs-studio
        firefox
        gimp
    ];  
    

}


