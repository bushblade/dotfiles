local wezterm = require("wezterm")
local mux = wezterm.mux

-- maximize on startup
-- wezterm.on("gui-startup", function()
-- 	local tab, pane, window = mux.spawn_window({})
-- 	window:gui_window():maximize()
-- end)

-- Main config here
local c = wezterm.config_builder()
c.color_scheme = "Catppuccin Mocha"
c.font = wezterm.font_with_fallback({ "Victor Mono Nerd Font", "Noto Color Emoji" })
c.hide_tab_bar_if_only_one_tab = true
c.window_background_opacity = 0.85
c.window_decorations = "RESIZE"
c.mouse_bindings = {
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "CTRL|SHIFT",
		action = wezterm.action.OpenLinkAtMouseCursor,
	},
}
c.bypass_mouse_reporting_modifiers = "CTRL|SHIFT"
c.hyperlink_rules = {
	{
		regex = "\\b\\w+://[\\w.-]+\\.[a-z]{2,15}\\S*\\b",
		format = "$0",
	},
	{
		regex = "\\bhttp://localhost:(\\d+)\\b",
		format = "http://localhost:$1",
	},
}
c.window_frame = {
	font = wezterm.font({ family = "Victor Mono Nerd Font", weight = "Bold" }),
	font_size = 11.0,
}

-- Tab bar styling plugin
wezterm.plugin.require("https://github.com/nekowinston/wezterm-bar").apply_to_config(c, {
	position = "top",
	max_width = 32,
	dividers = "rounded", -- or "slant_left", "arrows", "slant_right", false
	indicator = {
		leader = {
			enabled = true,
			off = " ",
			on = " ",
		},
		mode = {
			enabled = true,
			names = {
				resize_mode = "RESIZE",
				copy_mode = "VISUAL",
				search_mode = "SEARCH",
			},
		},
	},
	tabs = {
		numerals = "arabic", -- or "roman"
		pane_count = "superscript", -- or "subscript", false
		brackets = {
			active = { "", ":" },
			inactive = { "", ":" },
		},
	},
	clock = { -- note that this overrides the whole set_right_status
		enabled = true,
		format = "%H:%M", -- use https://wezfurlong.org/wezterm/config/lua/wezterm.time/Time/format.html
	},
})

-- Launch Tmux at start
c.default_prog = { "/usr/bin/tmux", "new-session", "-A", "-s", "default" }

return c
