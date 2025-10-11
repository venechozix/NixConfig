{ config , pkgs, inputs, ...}:

{
  home.username = "chozix";
  home.homeDirectory = "/home/chozix";
  home.stateVersion = "25.05";

  programs.git = {
    enable = true;
    userName = "chozix";
    userEmail = "venechozix@gmail.com";
    extraConfig ={
      init.defaultBranch = "main";
    };
  };


  programs.bash = {
    enable = true;
    shellAliases = {
      btw = "echo i use nixos btw";
    };
  };

  home.packages = with pkgs; [
    inputs.zen-browser.packages."${system}".default
    sonobus
  ];
}
