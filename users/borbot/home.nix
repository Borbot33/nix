{ ... }:
{
	home = {
		username = "borbot";
		homeDirectory = "/home/borbot";
		stateVersion = "25.05";
	};

	imports = [
		../../dotfiles/zsh
		../../dotfiles/neovim
	];

	programs.git = {
		enable = true;
		settings = {
			user = {
				name = "Borbot";
				email = "github@borbot.xyz";
			};
		};
	};

	programs.home-manager.enable = true;
}
