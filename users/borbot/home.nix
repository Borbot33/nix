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

	programs.home-manager.enable = true;
}
