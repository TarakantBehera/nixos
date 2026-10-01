{
    description = "central flake.nix";
    
    inputs = {
      nispkgs.url = "nixpkgs/nixos-unstable";

      home-manager = {
        url = "github:nix-community/home-manager";
        inputs.nixpkgs.follows = "nixpkgs";
      };
    };

    outputs = { self, nixpkgs, home-manager,  ... }: {
      
      # builds the system
      # nixosConfiguration tells which system it is.
      # lib.nixosSystem; nixpkgs lib builds the system based on the information from the modules
      
      nixosConfigurations = {
        nixos-btw = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [ 
     
            # location of the pc module
            ./dotnix/devices/pc

	    # home-manager
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.nerd-cat = import ./dotnix/home;
	    } 

          ];
        };
      };
   };
}
