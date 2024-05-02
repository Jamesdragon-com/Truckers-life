local marker -- Define marker globally

function onServerSendMessage()
    local py = spawnPlayer (source, 2765.07764, -2474.98657, 13.47656, 90, 8, 0, 0, spawnTeam) -- spawns player with random skin
    local x,y,z = getElementPosition(source)
    spawn_veh(x,y+3,z)
    setCameraTarget (source, source)
    setPlayerHudComponentVisible ( source,"all",true )
    marker = createMarker (-87.47778, -1194.11377, 1, "cylinder", 1.5, 255, 255, 0, 170 ) -- Define marker globally
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

addEvent("onPlayerAcceptCargo", true)
addEventHandler("onPlayerAcceptCargo", root, function(cargoType, cargoDestination, cargoPrice, cargoDeliveryTime)
    -- Here you can implement the logic to handle cargo acceptance
    -- For example, you can update the player's state, deduct money, start delivery timer, etc.
    -- You can use MySQL queries or save the state in player's data

    -- Output the cargo acceptance message
    outputChatBox("Cargo Accepted: " .. cargoType .. " to " .. cargoDestination .. " for $" .. cargoPrice , source, 0, 255, 0)
end)
