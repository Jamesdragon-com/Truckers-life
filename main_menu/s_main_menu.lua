function spawnPlayerHandler()
    -- Place your code here to spawn the player
    -- For example:
    spawnPlayer(source, 0, 0, 5, 0, math.random(0, 288), 0, 0)
    setCameraTarget(source, source)
    outputChatBox("Hi", source, 0, 255, 14)
end

addEvent("OnbtnClick", true)
addEventHandler("OnbtnClick", root, spawnPlayerHandler)

