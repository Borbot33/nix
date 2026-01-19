{
	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
		nixpkgs-unstable.url = "github:nixos/nixpkgs?ref=nixos-unstable";

		flake-parts.url = "github:hercules-ci/flake-parts";
		catppuccin.url = "github:catppuccin/nix";

		nixvim = {
			url = "github:nix-community/nixvim/nixos-25.11";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		home-manager = {
			url = "github:nix-community/home-manager/release-25.11";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		home-manager-unstable = {
			url = "github:nix-community/home-manager/master";
			inputs.nixpkgs.follows = "nixpkgs-unstable";
		};

	};

	outputs = inputs:
		inputs.flake-parts.lib.mkFlake { inherit inputs; } {
			systems = [ 
				"x86_64-linux" 
				"aarch64-linux" 
			];
			imports = [
				./hosts/nixos
			];
		};
}
