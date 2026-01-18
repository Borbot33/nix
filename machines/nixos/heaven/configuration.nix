{ config, pkgs, ... }:
{
	imports = [ 	
		./hardware-configuration.nix
	];

	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;

	boot.kernelPackages = pkgs.linuxPackages_latest;

	networking = {
		hostName = "heaven";
		networkmanager = {
			enable = true;
		};
	};

	desktop = {
		enable = true;

		desktop-env = {
			plasma.enable = true;
		};

		drivers = {
			nvidia = {
				enable = true;
				open = true;
			};

			bluetooth.enable = true;
		};
	};

	system.stateVersion = "25.05"; 
}
