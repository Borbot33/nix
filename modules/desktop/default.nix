{ lib, config, pkgs, ... }:
let
	desktop = config.desktop;
in
{
	options.desktop = {
		enable = lib.mkEnableOption "Install desktop pc packages";
	};

	config = lib.mkIf desktop.enable {
		services = {
			displayManager = {
				sddm.enable = true;
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

			printing.enable = true;
			pulseaudio.enable = false;
		};

		environment.systemPackages = with pkgs; [
			spotify
			discord
			kitty
			signal-desktop
		];

		fonts.packages = with pkgs; [
			nerd-fonts._0xproto
		];
		programs.firefox.enable = true;

	};

	imports = [
		./desktop-env
		./drivers
	];
}
