{ config, pkgs, ... }:

{
	imports = [ 	
		./hardware-configuration.nix
	];

	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;

	boot.kernelPackages = pkgs.linuxPackages_latest;

	networking = {
		hostName = "warden";
		networkmanager = {
			enable = true;
		};
	};

	system.stateVersion = "25.05";
}
