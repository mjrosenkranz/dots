{
  description = "mjr dotfiles";

  inputs = {
	nixpkgs.url = "nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }: {
    let
      system = "x86_64-linux";

      pkgs = import nixpkgs {
        inherit system;
        config = { allowUnfree = true; }; # Forgive me Mr. Stallman
      };
    in
    {
      nixosConfigurations.morgpad = nixpkgs.lib.nixosSystem {
        inherit system;
	modules = [ ./configuration.nix ];
      };
    };
  };
}
