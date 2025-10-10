{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    	
  	};
  };
  outputs = { nixpkgs, home-manager, ... }: {
    nixosConfigurations.nixpc = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [ 
        ./configuration.nix
        home-manager.nixosModules.home-manager 
				{
       		home-manager = {
						useGlobalPkgs = true;
						useUserPackages = true;
						users.chozix = import ./home.nix;
						backupFileExtension = "backup";
					}; 
        } 
      ];
    };
  };
}
