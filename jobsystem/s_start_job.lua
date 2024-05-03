local isjob = false

function start_job()
   
   if isjob then
   return true
   else
    return false
   end
end

local marker -- Define marker globally

function onServerSendMessage(sX,sY,sZ,tX,tY,tZ)
    isjob = true
    if isjob then
    local py = spawnPlayer (source, sX, sY, sZ, 90, 8, 0, 0, spawnTeam) -- spawns player with random skin
    local x,y,z = getElementPosition(source)
    spawn_veh(x,y+3,z)
    setCameraTarget (source, source)
    setPlayerHudComponentVisible ( source,"all",true )
    marker = createMarker (tX,tY,tZ, "cylinder", 1.5, 255, 255, 0, 170 ) 
    end
end
addEvent("onServerSendMessage", true)
addEventHandler("onServerSendMessage", root, onServerSendMessage)

function spawn_veh(x,y,z)
    local my_veh = createVehicle (403, x, y, z, 0, 0, 90)
    local my_veh_trailer = createVehicle (450, -56.34701, -1138.74963, 1.5, 0, 0, 90)
    setVehicleVariant(my_veh_trailer, 0)
    attachTrailerToVehicle(my_veh, my_veh_trailer)
    warpPedIntoVehicle(source, my_veh, 0) 
end




