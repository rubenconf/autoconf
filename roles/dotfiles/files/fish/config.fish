# Autostart Hyprland in TTY1
if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
  clear
  exec start-hyprland > /dev/null 2>&1 &
end
