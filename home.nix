{ config , pkgs, ...}:

{
  home.username = "chozix";
  home.homeDirectory = "/home/chozix";
	home.stateVersion = "25.05";
  programs.bash = {
    enable = true;
    shellAliases = {
      btw = "echo i use nixos btw";
    };
		
  };
}
