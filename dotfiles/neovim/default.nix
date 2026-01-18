{ config, self, ... }:
{
	programs.neovim = {
		viAlias = true;
		vimAlias = true;
		defaultEditor = true;
	};

	programs.nixvim = {
		enable = true;

		colorschemes = { 
			catppuccin = {
				enable = true;
				settings = {
					flavour = "frappe";

					borders = true;
					contrast = true;

				};
			};
		};

		plugins = {
			barbar = {
				enable = true;
			};

			colorizer = {
				enable = true;
			};

			web-devicons = {
				enable = true;
			};


			neo-tree = {
				enable = true;
				settings = {
					close_if_last_window = true;
					enable = true;
				};
			};
		};
	};
}
