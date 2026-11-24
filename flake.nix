{
    description = "central flake.nix";
    
    # to update, change the url in inputs 
    # and run nix flake update and nixos-rebuid switch to switch to it
    inputs = {
      nispkgs.url = "nixpkgs/nixos-unstable";
    };

    outputs = { self, nixpkgs, home-manager,  ... }: {
      
      nixosConfigurations = {
        nixos-btw = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [ 
     
            # location of the pc module
            ./desktop
	  ];
    	} 
        };
      };
   };
}
