
function onServerSendMessage()
    local py = spawnPlayer (source, -79.19237, -1126.71826, 1.07812, -90, 0, 0, 0, spawnTeam) -- spawns player with random skin
    local x,y,z = getElementPosition(source)
    spawn_veh(x,y+10,z)
    setCameraTarget (source, source)
end
addEvent("onServerSendMessage", true) -- 2nd argument should be set to true, in order to be triggered from counter side (in this case client-side)
addEventHandler("onServerSendMessage", root, onServerSendMessage)

function spawn_veh(x,y,z)
local my_veh= createVehicle (419,x, y, z, 0, 0, 0)
end