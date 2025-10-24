{ config , pkgs, inputs, ...}:

{
  home.username = "chozix";
  home.homeDirectory = "/home/chozix";
  home.stateVersion = "25.05";

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

    programs.bash = {
        enable = true;
        shellAliases = {
            btw = "echo i use nixos btw";
        };
    };


    home.packages = with pkgs; [
        inputs.zen-browser.packages."${system}".default
    ];
}
