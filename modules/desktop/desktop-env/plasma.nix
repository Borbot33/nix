{ lib, config, options, ... }:
let
	plasma = config.desktop.desktop-env.plasma;
in
{
	options.desktop.desktop-env.plasma = {
		enable = lib.mkEnableOption "Enable the plasma desktop environment";
	};

	config = lib.mkIf plasma.enable {
		services = {
			desktopManager = {
				plasma6.enable = true;
			};
		};
	};
}
