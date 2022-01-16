{
  description = "mjr dotfiles";

  inputs = {
	nixpkgs.url = "nixpkgs/nixos-unstable";
	home-manager.url = "github:nix-community/home-manager/master";
    	home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";

      pkgs = import nixpkgs {
        inherit system;
        config = { allowUnfree = true; };
      };
    in
    {
      
      homemanagerConfigurations = {
        mjr = home-manager.lib.homeManagerConfiguration {
          configuration = { pkgs, config, ... }:
	    {
	    	imports = [ ./neovim.nix ];
	    };
      	  system = "x86_64-linux";
	  homeDirectory = "/home/mjr";
	  username = "mjr";
	};
      };
      
      nixosConfigurations.morgpad = nixpkgs.lib.nixosSystem {
        inherit system;
	modules = [ ./configuration.nix ];
      };
    };
}
