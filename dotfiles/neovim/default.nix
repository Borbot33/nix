{ config, self, ... }:
{
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

			lualine = {
				enable = true;
			};

			indent-blankline = {
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

		globals = {
			mapleader = " ";
		};

		opts = {
			number = true;
			relativenumber = true;

			tabstop = 5;
			shiftwidth = 5;
			expandtab = false;
		};

		keymaps = [ 
			{
				mode = "n";
				key = "<C-n>";
				action = "<cmd>Neotree toggle<CR>";
				options = {
					silent = true;
				};
			}
		];
	};
}
