-- Function to synchronize in-game time with GMT time
function synchronizeTimeWithGMT()
    local serverTime = getRealTime()  -- Get the server's time
    local serverTimestamp = serverTime.timestamp  -- Get the timestamp

    local gmtOffset = 0  -- GMT offset in seconds
    local gmtTime = serverTimestamp + gmtOffset  -- Calculate the GMT time

    -- Set the in-game time to match the GMT time
    setTime(gmtTime / 3600 % 24, 0)  -- Convert seconds to hours and set time (GMT)
end

-- Call the function to synchronize time when needed
synchronizeTimeWithGMT()



