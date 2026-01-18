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

	services = {
		displayManager = {
			sddm.enable = true;
		};
		
		desktopManager = {
			plasma6.enable = true;
		};

		pipewire = {
			enable = true;

			alsa = {
				enable = true;
				support32Bit = true;
			};

			pulse.enable = true;
			jack.enable = true;
		};

		xserver = {
			videoDrivers = [ "nvidia" ];
		};

		printing.enable = true;
		pulseaudio.enable = false;
	};

	hardware = {
		graphics.enable = true;
		nvidia = {
			open = true; 
			nvidiaSettings = true;

			powerManagement = {
				enable = true;
			};

			package = config.boot.kernelPackages.nvidiaPackages.production;
		};
	};

	environment.systemPackages = with pkgs; [
		spotify
		discord
		kitty
	];

	fonts.packages = with pkgs; [
		nerd-fonts._0xproto
	];

	programs.firefox.enable = true;

	system.stateVersion = "25.05"; # Did you read the comment?
}
