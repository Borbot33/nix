{ lib, config, ... }:
let
	bluetooth = config.desktop.drivers.nvidia;
in
{
	options.desktop.drivers.bluetooth = {
		enable = lib.mkEnableOption "Enable bluetooth drivers";
	};

	config = lib.mkIf bluetooth.enable {
		hardware = {
			bluetooth = {
				enable = true;
			};
		};

		hardware.enableAllFirmware = true;
	};
}

