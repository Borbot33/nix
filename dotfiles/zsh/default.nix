{
	programs = {
		starship = {
			enable = true;
		};

		zoxide = {
			enable = true;
			enableZshIntegration = true;
			options = [ "--cmd cd" ];
		};

		zsh = {
			enable = true;
			enableCompletion = false;
			zplug = {
				enable = true;
				plugins = [
					{ name = "zsh-users/zsh-autosuggestions"; }
					{ name = "zsh-users/zsh-syntax-highlighting"; }
					{ name = "zsh-users/zsh-completions"; }
				];
			};
		};
	};
}
