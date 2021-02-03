local M = {}

-- we need a variable for the session, window, and window
local session = "test"
local window = "window"
local pid = ""

function M.send_to_tmux(text)
    -- start racket and get the pid
    --      racket -f % -i
    -- find the pane with that pid
    --
    -- send text to that pane
    --   maybe start new tmux session
    --   tmux neww -t ${filename-racket}
    --tmux list-panes -F '#{pane_active} #{pane_pid}'
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

function M.start_sesh(cmd)
    local res = os.execute("pidof racket")
    print(res)
end

return M
