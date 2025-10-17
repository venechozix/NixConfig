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
        neovim
        python313
        python314
        pyenv
        python3Packages.sounddevice
        vscodium
        #school
        ciscoPacketTracer8
        #utils
        pavucontrol
        fastfetch
        spotify
        vesktop
        keepassxc
        zip
        unzip
        rar
        unrar
        kdePackages.dolphin
        wine
        winetricks
        obs-studio
    ];  
    

}


