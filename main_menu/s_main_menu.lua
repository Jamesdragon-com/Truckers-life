
function onServerSendMessage()
    local py = spawnPlayer (source, -79.19237, -1126.71826, 1.07812, 90, 8, 0, 0, spawnTeam) -- spawns player with random skin
    local x,y,z = getElementPosition(source)
    spawn_veh(x,y+3,z)
    setCameraTarget (source, source)
    setPlayerHudComponentVisible ( source,"all",true )
end
addEvent("onServerSendMessage", true) -- 2nd argument should be set to true, in order to be triggered from counter side (in this case client-side)
addEventHandler("onServerSendMessage", root, onServerSendMessage)

function spawn_veh(x,y,z)
local my_veh = createVehicle (403,x, y, z, 0, 0, 90)
local my_veh_trailer = createVehicle (450,-56.34701, -1138.74963, 1.5, 0, 0, 90)
setVehicleVariant (my_veh_trailer, 0)
attachTrailerToVehicle ( my_veh, my_veh_trailer )
warpPedIntoVehicle ( source, my_veh,0 ) 
end



