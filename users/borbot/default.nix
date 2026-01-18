{ config, pkgs, ... }:
{
	users = {
		users = {
			borbot = {
				isNormalUser = true;
				description = "borbot";
				extraGroups = [ "networkmanager" "wheel" ];
				packages = with pkgs; [
					fastfetch
				];
				shell = pkgs.zsh;
			};
		};
	};

	programs.zsh.enable = true;
}
