local wezterm = require 'wezterm';

return {
  font = wezterm.font_with_fallback({"Cascadia Code PL", "Symbols Nerd Font", "NotoSansMono Nerd Font", "Noto Sans CJK KR", "Noto Sans Symbols", "Noto Sans Symbols2"}),
  font_size = 11.0,
  colors = {
    foreground = "#abb2bf",
    background = "#21252b",
    cursor_bg = "#abb2bf",
    selection_fg = "#21252b",
    selection_bg = "#abb2bf",
    ansi = {"#21252b", "#e06c75", "#98c379", "#e5c07b", "#61afef", "#c678dd", "#56b6c2", "#abb2bf"},
    brights = {"#21252b", "#e06c75", "#98c379", "#e5c07b", "#61afef", "#c678dd", "#56b6c2", "#abb2bf"},
    compose_color = "red",
  },
  default_prog = {"/usr/bin/tmux"},
  window_frame = {
    font = wezterm.font({ family = "Cascadia Code PL" }),
  },
}
