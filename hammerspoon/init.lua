local function yabai(args)
  local command = string.format("/usr/local/bin/yabai -m %s", args)
  os.execute(command)
end

local directions = {
    h = "west",
    l = "east",
    k = "north",
    j = "south",
}
for key, direction in pairs(directions) do
    -- focus windows
    hs.hotkey.bind({ "cmd" }, key, function()
        yabai(string.format("window --focus %s", direction))
    end)
    -- swap windows
    hs.hotkey.bind({ "cmd", "shift" }, key, function()
        yabai(string.format("window --swap %s", direction))
    end)
    -- warp windows
    hs.hotkey.bind({ "cmd", "alt" }, key, function()
        yabai(string.format("window --warp %s", direction))
    end)
end

hs.hotkey.bind({ "cmd", "shift" }, "f", function()
  yabai("window --toggle float")
end)

hs.hotkey.bind({ "cmd", "shift" }, "y", function()
  yabai("window --toggle split")
end)

hs.hotkey.bind({ "cmd" }, "return", function()
  os.execute("/usr/local/bin/kitty @ launch --type os-window");
end)
