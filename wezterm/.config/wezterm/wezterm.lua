-- Pull in the wezterm API
local wezterm = require("wezterm")
-- Plugins
--
-- local smart_path = "/Users/rogvelazquez/Documents/creeps/reps/smart-splits.nvim"
-- local smart_splits = wezterm.plugin.require(smart_path)

-- This will hold the configuration.
local config = wezterm.config_builder()
local act = wezterm.action

config.enable_kitty_keyboard = true
-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- Bamboo
config.color_scheme = "Gruvbox Dark (Gogh)"
config.colors = {
	cursor_bg = "#92826B",
	-- foreground = "#dcd7ba",
	-- background = "#1f1f28",

	-- cursor_bg = "#c8c093",
	cursor_fg = "#c8c093",
	cursor_border = "#c8c093",

	selection_fg = "#c8c093",
	selection_bg = "#2d4f67",

	-- scrollbar_thumb = "#303333",
	-- split = "#16161d",

	-- ansi = { "#090618", "#c34043", "#76946a", "#c0a36e", "#7e9cd8", "#957fb8", "#6a9589", "#c8c093" },
	-- brights = { "#727169", "#e82424", "#98bb6c", "#e6c384", "#7fb4ca", "#938aa9", "#7aa89f", "#dcd7ba" },
	-- indexed = { [16] = "#ffa066", [17] = "#ff5d62" },
}

-- config.font = wezterm.font("MesloLGS NF")
config.font = wezterm.font("MesloLGS Nerd Font Mono", { weight = "Regular" })
config.font_size = 19
config.line_height = 1.3
config.window_padding = {
	left = 0,
	right = 10,
	top = 25,
	bottom = 0,
}
config.set_environment_variables = {
	TERM = "xterm-256color",
	LC_ALL = "en_US.UTF-8",
}

config.adjust_window_size_when_changing_font_size = false
config.debug_key_events = false
config.enable_tab_bar = false
config.native_macos_fullscreen_mode = true
config.window_close_confirmation = "NeverPrompt"
config.window_decorations = "RESIZE"
config.macos_window_background_blur = 25

-- image
local imgPath = wezterm.home_dir .. "/Pictures/pic.png"
config.background = {
	{
		source = {
			Color = "#322F30",
		},
		width = "100%",
		height = "100%",
		opacity = 0.98,
		hsb = {
			brightness = 0.8,
			hue = 1,
		},
	},
	{
		source = {
			File = imgPath,
		},
		width = "Cover",
		height = "Cover",
		vertical_align = "Middle",
		horizontal_align = "Center",
		opacity = 0.03,
		hsb = {
			-- Darken the background image by reducing it to 1/3rd
			brightness = 0.1,

			-- You can adjust the hue by scaling its value.
			-- a multiplier of 1.0 leaves the value unchanged.
			hue = 0,

			-- You can adjust the saturation also.
			saturation = 0,
		},
	},
}

-- wezterm.on("user-var-changed", function(window, pane, name, value)
-- 	local overrides = window:get_config_overrides() or {}
-- 	if name == "ZEN_MODE" then
-- 		local incremental = value:find("+")
-- 		local number_value = tonumber(value)
-- 		if incremental ~= nil then
-- 			while number_value > 0 do
-- 				window:perform_action(wezterm.action.IncreaseFontSize, pane)
-- 				number_value = number_value - 1
-- 			end
-- 			overrides.enable_tab_bar = false
-- 		elseif number_value < 0 then
-- 			window:perform_action(wezterm.action.ResetFontSize, pane)
-- 			overrides.font_size = nil
-- 			overrides.enable_tab_bar = true
-- 		else
-- 			overrides.font_size = number_value
-- 			overrides.enable_tab_bar = false
-- 		end
-- 	end
-- 	window:set_config_overrides(overrides)
-- end)

-- splits screen
-- Leader is the same as my old tmux prefix
config.keys = {
	-- splitting
	{
		key = ",",
		mods = "SUPER",
		action = wezterm.action.SplitPane({
			direction = "Down",
			size = { Percent = 30 },
		}),
	},
	{
		key = ".",
		mods = "SUPER",
		action = wezterm.action.SplitPane({
			direction = "Right",
			size = { Percent = 20 },
		}),
	},
	-- --   -- maximize pane
	{
		key = "m",
		mods = "SUPER",
		action = act.TogglePaneZoomState,
	},
	{
		key = "h",
		mods = "CTRL",
		action = act.ActivatePaneDirection("Left"),
	},
	{
		key = "l",
		mods = "CTRL",
		action = act.ActivatePaneDirection("Right"),
	},
	-- {
	-- 	key = "k",
	-- 	mods = "CTRL",
	-- 	action = act.ActivatePaneDirection("Up"),
	-- },
	-- {
	-- 	key = "j",
	-- 	mods = "CTRL",
	-- 	action = act.ActivatePaneDirection("Down"),
	-- },
	-- {
	-- 	key = "H",
	-- 	mods = "SUPER|SHIFT",
	-- 	action = act.AdjustPaneSize({ "Left", 3 }),
	-- },
	-- {
	-- 	key = "J",
	-- 	mods = "SUPER|SHIFT",
	-- 	action = act.AdjustPaneSize({ "Down", 3 }),
	-- },
	-- { key = "K", mods = "SUPER|SHIFT", action = act.AdjustPaneSize({ "Up", 3 }) },
	-- {
	-- 	key = "L",
	-- 	mods = "SUPER|SHIFT",
	-- 	action = act.AdjustPaneSize({ "Right", 3 }),
	-- },
	-- {
	-- 	key = ";",
	-- 	mods = "SUPER",
	-- 	action = act.CloseCurrentPane({ confirm = true }),
	-- },
}

-- -- Smart splits configuration
-- smart_splits.apply_to_config(config, {
-- 	-- the default config is here, if you'd like to use the default keys,
-- 	-- you can omit this configuration table parameter and just use
-- 	-- smart_splits.apply_to_config(config)
--
-- 	-- directional keys to use in order of: left, down, up, right
-- 	direction_keys = { "h", "j", "k", "l" },
-- 	-- if you want to use separate direction keys for move vs. resize, you
-- 	-- can also do this:
-- 	-- direction_keys = {
-- 	-- 	move = { "h", "j", "k", "l" },
-- 	-- resize = { "LeftArrow", "DownArrow", "UpArrow", "RightArrow" },
-- 	-- },
-- 	-- modifier keys to combine with direction_keys
-- 	modifiers = {
-- 		move = "CTRL", -- modifier to use for pane movement, e.g. CTRL+h to move left
-- 		resize = "META", -- modifier to use for pane resize, e.g. META+h to resize to the left
-- 	},
-- 	-- log level to use: info, warn, error
-- 	log_level = "info",
-- })

-- and finally, return the configuration to wezterm
return config
