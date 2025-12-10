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
	  viAlias = true;
	  vimAlias = true;

	  # Add plugins
	  plugins = with pkgs.vimPlugins; [
	    telescope-nvim
	    plenary-nvim # Required dependency for Telescope
        catppuccin-vim
	  ];
      # Add system tools used by Telescope
      extraPackages = with pkgs; [
        fd
        ripgrep
      ];

	};

	home.file.".config/nvim".source = ./nvim;

    programs.git = {
        enable = true;
        settings ={
            core.askPass = "";
            credential.helper = "store";
            init.defaultBranch = "main";
            user.name = "chozix";
            user.email = "venechozix@gmail.com";
        };
    };

    home.sessionVariables = {
        home.sessionVariables = {
        # 1. Forces SDL applications  to use the Wayland backend.
        SDL_VIDEODRIVER = "wayland"; 
        
        # 2. Tells SDL/libdecor not to draw its own title bar.
        # This prevents the white bar from appearing, leaving window management to Niri.
        SDL_VIDEO_WAYLAND_PREFER_LIBDECOR = "0";
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
        inputs.zen-browser.packages."${stdenv.hostPlatform.system}".default
        chatterino7
    ];
}
