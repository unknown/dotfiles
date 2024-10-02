local wezterm = require "wezterm"

local config = wezterm.config_builder()

config.set_environment_variables = {
  PATH = "/opt/homebrew/bin:" .. os.getenv("PATH"),
}

config.color_scheme = "kanagawabones"

config.front_end = "WebGpu"

config.font = wezterm.font({ family = "Berkeley Mono" })
config.font_size = 15.8
config.line_height = 1.1

-- window background blur
config.window_background_opacity = 0.9
config.macos_window_background_blur = 30

-- removes the title bar
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
-- config.window_decorations = "RESIZE"
config.window_frame = {
  font = wezterm.font({ family = "Inter", weight = "Medium" }),
  font_size = 12.0,
}

config.window_close_confirmation = "NeverPrompt"

config.keys = {
  {
    mods = "OPT",
    key = "LeftArrow",
    action = wezterm.action.SendKey({ mods = "ALT", key = "b" }),
  },
  {
    mods = "OPT",
    key = "RightArrow",
    action = wezterm.action.SendKey({ mods = "ALT", key = "f" }),
  },
  {
    mods = "SUPER",
    key = "LeftArrow",
    action = wezterm.action.SendKey({ mods = "CTRL", key = "a" }),
  },
  {
    mods = "SUPER",
    key = "RightArrow",
    action = wezterm.action.SendKey({ mods = "CTRL", key = "e" }),
  },
  {
    mods = "SUPER",
    key = "Backspace",
    action = wezterm.action.SendKey({ mods = "CTRL", key = "u" }),
  },
  {
    mods = "SUPER",
    key = ",",
    action = wezterm.action.SpawnCommandInNewTab {
      cwd = wezterm.home_dir,
      args = { "nvim", wezterm.config_file },
      domain = "DefaultDomain",
    },
  },
  {
    mods = "SUPER|SHIFT",
    key = "<",
    action = wezterm.action.SpawnCommandInNewTab {
      cwd = wezterm.home_dir,
      args = { "nvim", ".config/" },
    },
  },
}

return config
