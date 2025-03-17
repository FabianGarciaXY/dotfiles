
-- Pull in the wezterm API
local wezterm = require("wezterm")


-- This will hold the configuration.
local config = wezterm.config_builder()

-- my coolnight colorscheme:
config.colors = {
	-- Add FF alpha channel
 	background = "#0D1015",
 	foreground = "#FFF2CC",
 	cursor_bg = "#FFF2CC",
 	cursor_border = "#FFF2CC",
 	cursor_fg = "#FFF2CC",
 	selection_bg = "#ffd966",
 	selection_fg = "#0c343d",
 	ansi = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#0FC5ED", "#a277ff", "#24EAF7", "#24EAF7" },
 	brights = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#A277FF", "#a277ff", "#24EAF7", "#24EAF7" },
}

config.font = wezterm.font("Cascadia Code", { weight = 'Bold', italic = true } )
config.font_size = 11
config.window_decorations = "NONE"
config.initial_rows = 46
config.initial_cols = 144
config.default_cursor_style = 'BlinkingBlock'
config.enable_tab_bar = true
config.tab_bar_at_bottom = false
config.hide_tab_bar_if_only_one_tab = true
config.enable_scroll_bar = false
config.window_background_opacity = 0.99 -- Required for acrylic
config.text_background_opacity = 1.0 -- Optional: prevents text transparency
-- config.window_background_opacity = 0.0 -- Required for acrylic
-- config.win32_system_backdrop = 'Mica'
config.window_padding = { left = 25, right = 8, top = 12, bottom = 4 }

-- Key maps
local act = wezterm.action

config.keys = {}

for i = 1, 8 do
	-- CTRL+ALT + number to activate that tab
  	table.insert(config.keys, {
		key = tostring(i),
    	mods = 'CTRL|ALT',
    	action = act.ActivateTab(i - 1),
	})
	-- F1 through F8 to activate that tab
	table.insert(config.keys, {
		key = 'F' .. tostring(i),
    	action = act.ActivateTab(i - 1),
	})
end


-- and finally, return the configuration to wezterm
return config

