{ inputs, lib, ... }:
let 
	user = "borbot";
	configurations = {
		heaven = { 
			homeModules = [
				inputs.catppuccin.homeModules.catppuccin
				../../dotfiles/kitty
			];
		};
		warden = { };
	};
in
{
	flake.nixosConfigurations = lib.mapAttrs (name: 
		machine: 
			inputs.nixpkgs-unstable.lib.nixosSystem {
				modules = [
					inputs.home-manager-unstable.nixosModules.home-manager
					../../modules
					./${name}/configuration.nix
					../../users/${user}
					./common
					{
						home-manager = {
							users.${user} = {
								imports = [
									inputs.nixvim.homeModules.nixvim
									../../users/${user}/home.nix
								] ++ (machine.homeModules or []);
							};
							backupFileExtension = "bak";
						};
					}
				];
				specialArgs = { inherit inputs; };
			}
	) configurations;
}
