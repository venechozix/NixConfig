{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager = {
        url = "github:nix-community/home-manager";
        inputs.nixpkgs.follows = "nixpkgs";
    };

    aagl = {
        url = "github:ezKEa/aagl-gtk-on-nix";
        inputs.nixpkgs.follows = "nixpkgs";
    };
    
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
  };

    outputs = { nixpkgs, home-manager, aagl, zen-browser, ... } @ inputs: {
        nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
            specialArgs = { inherit inputs; };
            modules = [

                ./configuration.nix
                home-manager.nixosModules.home-manager
                {
                    home-manager = {
                        useGlobalPkgs = true;
                        useUserPackages = true;
                        users.chozix = import ./home.nix;
                        backupFileExtension = "backup";
                        extraSpecialArgs = { inherit inputs; };
                    };
                }
                {
                    imports = [ aagl.nixosModules.default ];
                    nix.settings = aagl.nixConfig; # Set up Cachix
                    programs.sleepy-launcher.enable = true;
                }
            ];
        };
    };
}
