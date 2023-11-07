local status, db = pcall(require, "dashboard")
if not status then
	---@diagnostic disable-next-line: param-type-mismatch
	vim.notify("没有找到 dashboard", "error")
	return
end

db.session_directory = vim.fn.stdpath("data") .. "/vimSession"
db.session_auto_save_on_exit = false
db.custom_footer = {
	"",
	"",
	"",
	">> 千里之行，始于足下 <<",
}
db.custom_center = {
	{
		icon = "🗓️  ",
		desc = "Projects                            ",
		action = "Telescope projects",
	},
	{
		icon = "📺  ",
		desc = "Recently Files                      ",
		action = "Telescope oldfiles",
	},
	{
		icon = "📝  ",
		desc = "Work Space                          ",
		desc = "Find File                           ",
		action = "Telescope find_files",
	},
	{
		icon = "🔍️  ",
		desc = "Find Text                           ",
		action = "Telescope live_grep",
	},
	{
		icon = "📄  ",
		desc = "New File                           ",
		action = "enew",
	},
	{
		icon = "🕹️  ",
		desc = "Edit .bashrc                        ",
		action = "edit ~/.bashrc",
	},
}

db.custom_header = {
	[[]],
	[[]],
	[[]],
	[[]],
	[[  ██████╗  ██████╗ ██╗   ██╗    ██████╗  █████╗ ███╗   ██╗ ]],
	[[  ██╔══██╗██╔═══██╗╚██╗ ██╔╝    ██╔══██╗██╔══██╗████╗  ██║ ]],
	[[  ██████╔╝██║   ██║ ╚████╔╝     ██║  ██║███████║██╔██╗ ██║ ]],
	[[  ██╔══██╗██║   ██║  ╚██╔╝      ██║  ██║██╔══██║██║╚██╗██║ ]],
	[[  ██║  ██║╚██████╔╝   ██║       ██████╔╝██║  ██║██║ ╚████║ ]],
	[[  ╚═╝  ╚═╝ ╚═════╝    ╚═╝       ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═══╝ ]],
	[[                                                           ]],
	[[                     [version : 1.0.0]                     ]],
	[[]],
	[[]],
	[[]],
	[[]],
	[[]],
	[[]],
}


local function themeSelect(theme)
	if theme == "doom" then
		db.setup({
			theme = "doom",
			config = {
				header = db.custom_header,
				center = db.custom_center,
				footer = db.custom_footer,
			},
		})
		return "doom"
	elseif theme == "hyper" then
		local shortcutgroup = "Normal"

		db.setup({
			theme = "hyper",
			config = {
				header = db.custom_header,
				shortcut = {
					{
						desc = "☕ Update",
						group = shortcutgroup,
						action = "PackerUpdate",
						key = "u",
					},
					{
						desc = "📑 Files",
						group = shortcutgroup,
						action = "Telescope oldfiles",
						key = "f",
					},
					{
						desc = "📺 Projects",
						group = shortcutgroup,
						action = "Telescope projects",
						key = "p",
					},
					{
						desc = "📻 Work Space",
						group = shortcutgroup,
						action = "Telescope xray23 list",
						key = "s",
					},
				},
				project = { limit = 2, icon = "🎵" },
				mru = { limit = 4, icon = "🕹️" },
				footer = {
					"",
					"",
					">> 千里之行，始于足下 <<                    ",
				},
			},
		})
		return "hyper"
	else
		return
	end
end

-- 使用doom主题
themeSelect("doom")

