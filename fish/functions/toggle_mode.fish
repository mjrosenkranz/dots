function toggle_mode --description "toggle appearance from dark or light mode"
  osascript -e 'tell app "System Events" to tell appearance preferences to set dark mode to not dark mode'
end
