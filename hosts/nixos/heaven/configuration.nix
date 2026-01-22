{ config, inputs, pkgs, ... }:
{
	imports = [ 	
		./hardware-configuration.nix
		inputs.jovian.nixosModules.default
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

	programs.steam = {
		enable = true;
	};

	jovian.steam.enable = true;

	fileSystems."/mnt/enderchest" = { 
		device = "/dev/disk/by-uuid/693d6b24-7d4a-40a0-8d99-2794aae8ddc9";
		fsType = "ext4";
	};

	system.stateVersion = "25.05"; 
}
