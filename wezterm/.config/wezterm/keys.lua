local wezterm = require("wezterm")
local mux = wezterm.mux
local act = wezterm.action

local key_config = {
	{ key = "s", mods = "SHIFT|CTRL", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "v", mods = "SHIFT|CTRL", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "LeftArrow", mods = "SHIFT|CTRL", action = act.AdjustPaneSize({ "Left", 1 }) },
	{ key = "RightArrow", mods = "SHIFT|CTRL", action = act.AdjustPaneSize({ "Right", 1 }) },
	{ key = "UpArrow", mods = "SHIFT|CTRL", action = act.AdjustPaneSize({ "Up", 1 }) },
	{ key = "DownArrow", mods = "SHIFT|CTRL", action = act.AdjustPaneSize({ "Down", 1 }) },
	{ key = "h", mods = "CTRL", action = act.EmitEvent("ActivatePaneDirection-left") },
	{ key = "j", mods = "CTRL", action = act.EmitEvent("ActivatePaneDirection-down") },
	{ key = "k", mods = "CTRL", action = act.EmitEvent("ActivatePaneDirection-up") },
	{ key = "l", mods = "CTRL", action = act.EmitEvent("ActivatePaneDirection-right") },
	{ key = "L", mods = "SHIFT|CTRL", action = act.ActivateTabRelative(1) },
	{ key = "H", mods = "SHIFT|CTRL", action = act.ActivateTabRelative(-1) },
	-- Leader keys
	{ key = "q", mods = "LEADER", action = act.CloseCurrentTab({ confirm = true }) },
	{ key = "f", mods = "LEADER", action = act.Search("CurrentSelectionOrEmptyString") },
	{ key = "[", mods = "LEADER", action = act.ActivateCopyMode },
	-- Rename workspace
	{
		key = "W",
		mods = "LEADER",
		action = act.PromptInputLine({
			description = "Enter new workspace name:",
			action = wezterm.action_callback(function(window, pane, line)
				local current_workspace = mux.get_active_workspace()
				if line then
					mux.rename_workspace(current_workspace, line)
				end
			end),
		}),
	},
	-- Tmux style bindings
	{ key = "s", mods = "LEADER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "v", mods = "LEADER", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "z", mods = "LEADER", action = act.TogglePaneZoomState },
	{ key = "w", mods = "LEADER", action = act.ShowLauncherArgs({ flags = "WORKSPACES|TABS" }) },
	{ key = "c", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain") },
}

for i = 1, 8 do
	-- Leader 1-9 to activate tab
	table.insert(key_config, {
		key = tostring(i),
		mods = "LEADER",
		action = act.ActivateTab(i - 1),
	})
end

return key_config
