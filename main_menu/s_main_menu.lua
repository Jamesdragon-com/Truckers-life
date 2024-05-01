function onServerSendMessage()

    spawnPlayer (source, 0, 0, 5, 0, 0, 0, 0, spawnTeam) -- spawns player with random skin
	setCameraTarget (source, source)
end
addEvent("onServerSendMessage", true) -- 2nd argument should be set to true, in order to be triggered from counter side (in this case client-side)
addEventHandler("onServerSendMessage", root, onServerSendMessage)