{ inputs, lib, ... }:
let 
	user = "borbot";
	configurations = {
		heaven = { };
		warden = { };
	};
in
{
	flake.nixosConfigurations = lib.mapAttrs (name: 
		machine: 
			inputs.nixpkgs-unstable.lib.nixosSystem {
				modules = [
					inputs.home-manager-unstable.nixosModules.home-manager
					../../users/${user}
					./${name}/configuration.nix
					./common
					{
						home-manager = {
							users.${user} = {
								imports = [
									inputs.nixvim.homeModules.nixvim
									../../users/${user}/home.nix
								];
							};
							backupFileExtension = "bak";
						};
					}
				];
			}
	) configurations;
}
