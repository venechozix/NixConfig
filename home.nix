{ config, lib, pkgs, inputs, ...}:

{
    home.username = "chozix";
    home.homeDirectory = "/home/chozix";
    home.stateVersion = "25.11";

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

	  plugins = with pkgs.vimPlugins; [
	    telescope-nvim
	    plenary-nvim 
        catppuccin-vim
        nvim-treesitter-textobjects
        
        nvim-lspconfig
        mason-nvim        # optional (see note)
        mason-lspconfig-nvim
        cmp-nvim-lsp
        nvim-cmp
        cmp-buffer
        cmp-path
        cmp-cmdline
        cmp-nvim-lsp-signature-help


        (nvim-treesitter.withPlugins (p: [
            p.bash
            p.c
            p.lua
            p.python
            p.javascript
            p.typescript
            p.json
            p.html
            p.css
            p.markdown
            p.markdown_inline
            p.nix
            p.go
            p.rust
          ]))
	  ];

      extraPackages = with pkgs; [
        fd
        ripgrep

        #Language Servers
        lua-language-server
        nil # Nix
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

    home.pointerCursor = {
        enable = true;
        name = "catppuccin-mocha-dark-cursors";
        package = pkgs.catppuccin-cursors.mochaDark;
        x11.enable = true;
        gtk.enable= true;
        sway.enable = true;
        size = 24;
    };

    gtk = {
        enable = true;

        theme = {
            name = "Adwaita-dark";
            package = pkgs.gnome-themes-extra;
        };

        iconTheme = {
            name = "Adwaita";
            package = pkgs.adwaita-icon-theme;
        };

        gtk3.extraConfig = {
            gtk-application-prefer-dark-theme = true;
        };
    };

    dconf.settings = {
        "org/gnome/desktop/interface" = {
            color-scheme = "prefer-dark";
        };
    };

    home.packages = with pkgs; [
        inputs.zen-browser.packages."${stdenv.hostPlatform.system}".default
        chatterino7
        brave
        qbittorrent
    ];
}
