local nowPlaying = {}
local uv = vim.loop
local timer = uv.new_timer()
local previousTrack = "None"

nowPlaying.appleScript = [[
  use AppleScript version "2.4"
  use scripting additions

  tell application "Spotify"
    set c to current track
    set trackName to name of c
    set artistName to artist of c
    set albumName to album of c
  end tell

  set trackInfo to artistName & " - " & trackName & linefeed & "Album: " & albumName
  return trackInfo
]]

nowPlaying.onRead = function(err, chunk)
  if err then
    vim.notify("Error reading from stdout: " .. err, 1000, { title = "Now Playing" })
    return
  end

  if chunk ~= nil then
    local data = {}
    if chunk then
      table.insert(data, chunk)
    end

    local currentTrack = string.gsub(chunk, "\n$", "")

    if currentTrack and currentTrack ~= previousTrack then
      vim.notify(currentTrack, 1000, { title = "Now Playing" })
      previousTrack = currentTrack
    end
  end
end

nowPlaying.start = function()
  -- Execute the AppleScript using osascript
  local stdout = uv.new_pipe(false)
  uv.spawn('osascript', {
    args = {'-e', nowPlaying.appleScript},
    stdio = {nil, stdout},
  }, function(code)

    -- If the script ran successfully, read the output
    if code == 0 and stdout then
      stdout:read_stop()
      stdout:close()
    end
  end)

  if stdout then
    -- Read the output of the AppleScript
    uv.read_start(stdout, function(err, chunk)
      nowPlaying.onRead(err, chunk)

      -- Stop the timer if it's active
      if timer and timer.is_active then
        timer:stop()
      end

      -- Restart the timer
      if timer then
        uv.timer_start(timer, 1000, 5000, function()
          nowPlaying.start()
        end)
      end
    end)
  end
end

return {
  start = nowPlaying.start()
}
