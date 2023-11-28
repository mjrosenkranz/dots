local geometry = require("hs.geometry")

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

-- hs.hotkey.bind({"cmd"}, "enter", function()
-- 
-- end)

-- hs.hotkey.bind({"shift", "cmd"}, "h",  function() 
--   local focused = hs.window.focusedWindow()
--   hs.layout.apply({
--     {nil, focused, focused:screen(), hs.layout.left50, 0, 0}
--   })
-- end)

-- hs.hotkey.bind({"shift", "cmd"}, "l",  function() 
--   local focused = hs.window.focusedWindow()
--   hs.layout.apply({
--     {nil, focused, focused:screen(), hs.layout.right50, 0, 0}
--   })
-- end)

-- hs.hotkey.bind({"shift", "cmd"}, "k",  function() 
--   local focused = hs.window.focusedWindow()
--   hs.layout.apply({
--     {nil, focused, focused:screen(), geometry.rect(0.10, 0.05, 0.80, 0.9), 0, 0}
--   })
-- end)

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