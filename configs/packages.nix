{ config, pkgs, ... }:
{

  programs.zsh.enable = true;

  fonts.packages = with pkgs; [
    # ===== Monospace / Coding =====
    jetbrains-mono
    fira-code
    fira-code-symbols
    cascadia-code
    source-code-pro
    hack-font
    inconsolata
    iosevka
    victor-mono

    # ===== Nerd Fonts (patched) =====
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
    nerd-fonts.hack
    nerd-fonts.iosevka
    nerd-fonts.caskaydia-cove
    nerd-fonts.meslo-lg
    nerd-fonts.inconsolata
    nerd-fonts.symbols-only

    # ===== Sans-serif / UI =====
    inter
    roboto
    roboto-slab
    noto-fonts
    open-sans
    source-sans
    work-sans
    oxygenfonts
    montserrat
    poppins

    # ===== Serif =====
    noto-fonts-cjk-serif
    source-serif
    libre-baskerville
    merriweather
    crimson
    eb-garamond

    # ===== Symbols / Icons =====
    font-awesome
    material-design-icons
    material-icons
    powerline-fonts
    powerline-symbols

    # ===== Emoji =====
    noto-fonts-color-emoji
    twitter-color-emoji

    # ===== Retro / Pixel =====
    cozette
    spleen
    tamzen
    creep
  ];

  fonts.fontconfig.enable = true;

  fonts.fontconfig.defaultFonts = {
    monospace = [ "JetBrainsMono Nerd Font" ];
    sansSerif = [
      "Inter"
      "Noto Sans"
    ];
    serif = [ "Noto Serif" ];
    emoji = [ "Noto Color Emoji" ];
  };

  virtualisation.docker = {
    enable = true;
  };

  nixpkgs.config.permittedInsecurePackages = [
    "python3.13-youtube-dl-2021.12.17"
  ];
  environment.systemPackages = with pkgs; [
    #dev
    libgccjit
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
    kdePackages.kdenlive
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
    castnow
    vlc
    openrgb-with-all-plugins
    gsettings-desktop-schemas
    geekbench

  ];

}
