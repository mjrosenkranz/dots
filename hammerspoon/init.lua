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

hs.hotkey.bind({"shift", "cmd"}, "h",  function() 
  local focused = hs.window.focusedWindow()
  hs.layout.apply({
    {nil, focused, focused:screen(), hs.layout.left50, 0, 0}
  })
end)

hs.hotkey.bind({"shift", "cmd"}, "l",  function() 
  local focused = hs.window.focusedWindow()
  hs.layout.apply({
    {nil, focused, focused:screen(), hs.layout.right50, 0, 0}
  })
end)
