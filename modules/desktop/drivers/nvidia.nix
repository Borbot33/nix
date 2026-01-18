{ lib, config, ... }:
let
	nvidia = config.desktop.drivers.nvidia;
in
{
	options.desktop.drivers.nvidia = {
		enable = lib.mkEnableOption "Enable nvidia drivers";
		open = lib.mkEnableOption "Enable open nvidia drivers";
	};

	config = lib.mkIf nvidia.enable {
		services = {
			xserver = {
				videoDrivers = [ "nvidia" ];
			};
		};

		hardware = {
			graphics.enable = true;
			nvidia = {
				open = nvidia.open; 
				nvidiaSettings = true;

				powerManagement = {
					enable = true;
				};

				package = config.boot.kernelPackages.nvidiaPackages.production;
			};
		};
	};
}

