vim.g.dashboard_default_executive = "telescope"
vim.g.dashboard_disable_statusline = 1
vim.g.dashboard_custom_header = {
	[[                                                     ]],
	[[                                                     ]],
	[[                                                     ]],
	[[  ███▄    █ ▓█████  ▒█████   ██▒   █▓ ██▓ ███▄ ▄███▓ ]],
	[[  ██ ▀█   █ ▓█   ▀ ▒██▒  ██▒▓██░   █▒▓██▒▓██▒▀█▀ ██▒ ]],
	[[ ▓██  ▀█ ██▒▒███   ▒██░  ██▒ ▓██  █▒░▒██▒▓██    ▓██░ ]],
	[[ ▓██▒  ▐▌██▒▒▓█  ▄ ▒██   ██░  ▒██ █░░░██░▒██    ▒██  ]],
	[[ ▒██░   ▓██░░▒████▒░ ████▓▒░   ▒▀█░  ░██░▒██▒   ░██▒ ]],
	[[ ░ ▒░   ▒ ▒ ░░ ▒░ ░░ ▒░▒░▒░    ░ ▐░  ░▓  ░ ▒░   ░  ░ ]],
	[[ ░ ░░   ░ ▒░ ░ ░  ░  ░ ▒ ▒░    ░ ░░   ▒ ░░  ░      ░ ]],
	[[    ░   ░ ░    ░   ░ ░ ░ ▒       ░░   ▒ ░░      ░    ]],
	[[          ░    ░  ░    ░ ░        ░   ░         ░    ]],
	[[                                 ░                   ]],
	[[                                                     ]],
	[[                                                     ]],
}
vim.g.dashboard_custom_section = {
	a = { description = { " New File                          " }, command = "DashboardNewFile" },
	b = { description = { " Find Files                 CTRL P " }, command = "Telescope find_files" },
	c = { description = { " Restore previous session   SPC s l" }, command = "SessionLoad" },
	-- d = { description = { " History                    " }, command = "DashboardFindHistory" },
	d = { description = { " Colorscheme                       " }, command = "Telescope colorscheme" },
}
