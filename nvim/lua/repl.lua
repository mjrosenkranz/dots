local M = {}

-- we need a variable for the session, window, and window
local session = "test"
local window = "window"

function M.send_to_tmux(text)
    -- find the window and pane we want
    -- $(tmux lsw), contains the name of our window
    -- if it doesnt exist then create one
    --   maybe start new tmux session
    --   tmux neww -t ${filename-racket}
    --   
    -- send keys
    text = text:gsub("['|\"]", "\\%1")
    local res = os.execute(
        "tmux send-keys -t " .. 
        session ..  ":" ..  window ..
        " -l '" .. text ..  "'\n"
    )

    if res ~= true then
        print("could not execute command")
    end
end

function M.set_session(session_name)
    session = session_name
end

function M.set_window(window_name)
    window = window_name
end

return M
