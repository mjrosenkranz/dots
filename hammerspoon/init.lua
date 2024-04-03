local geometry = require("hs.geometry")

hs.hotkey.bind({"cmd", "shift"}, "r", function()
  hs.reload()
end)

-- focusing

hs.hotkey.bind({"cmd"}, "h", function()
	hs.window.focusedWindow().focusWindowWest()
end)

hs.hotkey.bind({"cmd"}, "j", function()
	hs.window.focusedWindow().focusWindowSouth()
end)

hs.hotkey.bind({"cmd"}, "k", function()
	hs.window.focusedWindow().focusWindowNorth()
end)
hs.hotkey.bind({"cmd"}, "l", function()
	hs.window.focusedWindow().focusWindowEast()
end)

function yabai(args, completion)
  local yabai_output = ""
  local yabai_error = ""
  -- Runs in background very fast
  local yabai_task = hs.task.new("/opt/homebrew/bin/yabai",nil, function(task, stdout, stderr)
    --print("stdout:"..stdout, "stderr:"..stderr)
    if stdout ~= nil then yabai_output = yabai_output..stdout end
    if stderr ~= nil then yabai_error = yabai_error..stderr end
    return true
  end, args)
  if type(completion) == "function" then
    yabai_task:setCallback(function() completion(yabai_output, yabai_error) end)
  end
  yabai_task:start()
end

function resize(args)
  local shell_task = hs.task.new("/Users/mjr/dots/yabai/resize.sh",nil, args)
  shell_task:start()
end

-- swapping

hs.hotkey.bind({"shift", "cmd"}, "h",  function() 
    yabai({"-m", "window", "--warp", "west"})
end)

hs.hotkey.bind({"shift", "cmd"}, "l",  function() 
    yabai({"-m", "window", "--warp", "east"})
end)

hs.hotkey.bind({"shift", "cmd"}, "j",  function() 
    yabai({"-m", "window", "--warp", "south"})
end)

hs.hotkey.bind({"shift", "cmd"}, "k",  function() 
    yabai({"-m", "window", "--warp", "north"})
end)

hs.hotkey.bind({"shift", "cmd"}, "y",  function() 
    yabai({"-m", "window", "--toggle", "split"})
end)

hs.hotkey.bind({"cmd", "alt"}, "t",  function() 
    yabai({"-m", "window", "--toggle", "float"})
end)

hs.hotkey.bind({"shift", "cmd"}, "f",  function() 
    yabai({"-m", "window", "--toggle", "zoom-parent"})
end)


-- window size

hs.hotkey.bind({"cmd"}, "left",  function()
    resize({"left", "50"})
end)

-- window size
hs.hotkey.bind({"cmd"}, "right",  function()
    resize({"right", "50"})
end)

-- new terminal
hs.hotkey.bind({"cmd"}, "return",  function()
  local shell_task = hs.task.new("/Applications/kitty.app/Contents/MacOS/kitty",nil, {"--single-instance"})
  shell_task:start()
end)
