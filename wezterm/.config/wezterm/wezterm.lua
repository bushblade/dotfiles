local wezterm = require("wezterm")
local act = wezterm.action
local mux = wezterm.mux

-- maximize on startup
wezterm.on("gui-startup", function()
	local tab, pane, window = mux.spawn_window({})
	window:gui_window():maximize()
end)

local function isViProcess(pane)
	-- get_foreground_process_name On Linux, macOS and Windows,
	-- the process can be queried to determine this path. Other operating systems
	-- (notably, FreeBSD and other unix systems) are not currently supported
	return pane:get_foreground_process_name():find("n?vim") ~= nil
	-- return pane:get_title():find("n?vim") ~= nil
end

local function conditionalActivatePane(window, pane, pane_direction, vim_direction)
	if isViProcess(pane) then
		window:perform_action(
			-- This should match the keybinds you set in Neovim.
			act.SendKey({ key = vim_direction, mods = "CTRL" }),
			pane
		)
	else
		window:perform_action(act.ActivatePaneDirection(pane_direction), pane)
	end
end

wezterm.on("ActivatePaneDirection-right", function(window, pane)
	conditionalActivatePane(window, pane, "Right", "l")
end)
wezterm.on("ActivatePaneDirection-left", function(window, pane)
	conditionalActivatePane(window, pane, "Left", "h")
end)
wezterm.on("ActivatePaneDirection-up", function(window, pane)
	conditionalActivatePane(window, pane, "Up", "k")
end)
wezterm.on("ActivatePaneDirection-down", function(window, pane)
	conditionalActivatePane(window, pane, "Down", "j")
end)

return {
	color_scheme = "Catppuccin Mocha",
	font = wezterm.font_with_fallback({ "Victor Mono Nerd Font", "Noto Color Emoji" }),
	hide_tab_bar_if_only_one_tab = true,
	window_background_opacity = 0.95,
	keys = {
		{ key = "x", mods = "SHIFT|CTRL", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
		{ key = "v", mods = "SHIFT|CTRL", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
		-- { key = "h", mods = "CTRL", action = act.ActivatePaneDirection("Left") },
		{ key = "LeftArrow", mods = "SHIFT|CTRL", action = act.AdjustPaneSize({ "Left", 1 }) },
		-- { key = "l", mods = "CTRL", action = act.ActivatePaneDirection("Right") },
		{ key = "RightArrow", mods = "SHIFT|CTRL", action = act.AdjustPaneSize({ "Right", 1 }) },
		-- { key = "k", mods = "CTRL", action = act.ActivatePaneDirection("Up") },
		{ key = "UpArrow", mods = "SHIFT|CTRL", action = act.AdjustPaneSize({ "Up", 1 }) },
		-- { key = "j", mods = "CTRL", action = act.ActivatePaneDirection("Down") },
		{ key = "DownArrow", mods = "SHIFT|CTRL", action = act.AdjustPaneSize({ "Down", 1 }) },
		-- Commented out as interfering with Tmux bindings
		-- { key = "h", mods = "CTRL", action = act.EmitEvent("ActivatePaneDirection-left") },
		-- { key = "j", mods = "CTRL", action = act.EmitEvent("ActivatePaneDirection-down") },
		-- { key = "k", mods = "CTRL", action = act.EmitEvent("ActivatePaneDirection-up") },
		-- { key = "l", mods = "CTRL", action = act.EmitEvent("ActivatePaneDirection-right") },
	},
	mouse_bindings = {
		-- Ctrl-click will open the link under the mouse cursor
		{
			event = { Up = { streak = 1, button = "Left" } },
			mods = "CTRL|SHIFT",
			action = wezterm.action.OpenLinkAtMouseCursor,
		},
	},
	bypass_mouse_reporting_modifiers = "CTRL|SHIFT",
	hyperlink_rules = {
		-- Linkify things that look like URLs and the host has a TLD name.
		-- Compiled-in default. Used if you don't specify any hyperlink_rules.
		{
			regex = "\\b\\w+://[\\w.-]+\\.[a-z]{2,15}\\S*\\b",
			format = "$0",
		},

		-- Linkify http://localhost:<port> links
		{
			regex = "\\bhttp://localhost:(\\d+)\\b",
			format = "http://localhost:$1",
		},
	},
	window_frame = {
		-- The font used in the tab bar.
		-- Roboto Bold is the default; this font is bundled
		-- with wezterm.
		-- Whatever font is selected here, it will have the
		-- main font setting appended to it to pick up any
		-- fallback fonts you may have used there.
		font = wezterm.font({ family = "Victor Mono Nerd Font", weight = "Bold" }),

		-- The size of the font in the tab bar.
		-- Default to 10. on Wwindows but 12.0 on other systems
		font_size = 11.0,

		-- The overall background color of the tab bar when
		-- the window is focused
		active_titlebar_bg = "#15161e",

		-- The overall background color of the tab bar when
		-- the window is not focused
		inactive_titlebar_bg = "#15161e",
	},
	colors = {
		-- tab_bar = {
		-- 	-- The color of the strip that goes along the top of the window
		-- 	-- (does not apply when fancy tab bar is in use)
		-- 	background = "#0b0022",
		--
		-- 	-- The active tab is the one that has focus in the window
		-- 	active_tab = {
		-- 		-- The color of the background area for the tab
		-- 		bg_color = "#7aa2f7",
		-- 		-- The color of the text for the tab
		-- 		fg_color = "#15161e",
		--
		-- 		-- Specify whether you want "Half", "Normal" or "Bold" intensity for the
		-- 		-- label shown for this tab.
		-- 		-- The default is "Normal"
		-- 		intensity = "Normal",
		--
		-- 		-- Specify whether you want "None", "Single" or "Double" underline for
		-- 		-- label shown for this tab.
		-- 		-- The default is "None"
		-- 		underline = "None",
		--
		-- 		-- Specify whether you want the text to be italic (true) or not (false)
		-- 		-- for this tab.  The default is false.
		-- 		italic = false,
		--
		-- 		-- Specify whether you want the text to be rendered with strikethrough (true)
		-- 		-- or not for this tab.  The default is false.
		-- 		strikethrough = false,
		-- 	},
		--
		-- 	-- Inactive tabs are the tabs that do not have focus
		-- 	inactive_tab = {
		-- 		bg_color = "#292e42",
		-- 		fg_color = "#545c7e",
		--
		-- 		-- The same options that were listed under the `active_tab` section above
		-- 		-- can also be used for `inactive_tab`.
		-- 	},
		--
		-- 	-- You can configure some alternate styling when the mouse pointer
		-- 	-- moves over inactive tabs
		-- 	inactive_tab_hover = {
		-- 		bg_color = "#33467c",
		-- 		fg_color = "#c0caf5",
		-- 		italic = true,
		--
		-- 		-- The same options that were listed under the `active_tab` section above
		-- 		-- can also be used for `inactive_tab_hover`.
		-- 	},
		--
		-- 	-- The new tab button that let you create new tabs
		-- 	new_tab = {
		-- 		bg_color = "#1a1b26",
		-- 		fg_color = "#c0caf5",
		--
		-- 		-- The same options that were listed under the `active_tab` section above
		-- 		-- can also be used for `new_tab`.
		-- 	},
		--
		-- 	-- You can configure some alternate styling when the mouse pointer
		-- 	-- moves over the new tab button
		-- 	new_tab_hover = {
		-- 		bg_color = "#1a1b26",
		-- 		fg_color = "#c0caf5",
		-- 		italic = true,
		--
		-- 		-- The same options that were listed under the `active_tab` section above
		-- 		-- can also be used for `new_tab_hover`.
		-- 	},
		-- },
	},
}
