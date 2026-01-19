{ lib, config, pkgs, ... }:
let 
	steam = config.desktop.gaming.steam;
in
{
	options.desktop.gaming.steam = {
		enable = lib.mkEnableOption "Should steam be installed";
	};

	config = lib.mkIf steam.enable {
		programs.steam = {
			enable = true;
		};

		programs.gamescope = {
			enable = true;
			capSysNice = true;
		};

		environment.systemPackages = with pkgs; [
			gamescope-wsi
		];
	};
}
