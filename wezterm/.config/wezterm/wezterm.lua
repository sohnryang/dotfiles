local wezterm = require 'wezterm';

return {
  font = wezterm.font_with_fallback({"Cascadia Code PL", "Symbols Nerd Font", "NotoSansMono Nerd Font", "Noto Sans CJK KR", "Noto Sans Symbols", "Noto Sans Symbols2"}),
  font_size = 11.0,
  color_schemes = {
    ["OneDark"] = {
      foreground = "#abb2bf",
      background = "#21252b",
      cursor_bg = "#abb2bf",
      selection_fg = "#21252b",
      selection_bg = "#abb2bf",
      ansi = {"#21252b", "#e06c75", "#98c379", "#e5c07b", "#61afef", "#c678dd", "#56b6c2", "#abb2bf"},
      brights = {"#21252b", "#e06c75", "#98c379", "#e5c07b", "#61afef", "#c678dd", "#56b6c2", "#abb2bf"},
      compose_color = "red",
    },
    ["Gruvbox Patched"] = {
      foreground = "#ebdbb2",
      background = "#282828",
      cursor_bg = "#ebdbb2",
      selection_fg = "#282828",
      selection_bg = "#ebdbb2",
      ansi = {"#282828", "#cc241d", "#98971a", "#d79921", "#458588", "#b16286", "#689d6a", "#a89984"},
      brights = {"#928374", "#fb4934", "#b8bb26", "#fabd2f", "#83a598", "#d3869b", "#8ec07c", "#ebdbb2"},
      compose_color = "red",
    }
  },
  color_scheme = "Gruvbox Patched",
  window_frame = {
    font = wezterm.font({ family = "Cascadia Code PL" }),
  },
}
