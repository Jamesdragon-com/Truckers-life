function setCameraOnPlayerJoin()
    -- slowly fade the camera in to make the screen visible
    fadeCamera(source, true, 2)
    -- set the player's camera to a fixed position, looking at a fixed point
    x = -1675
    y = -356
    z = 15
    setCameraMatrix(source,x , y ,z, 1468.388671875, -918.42474365234, 99.881813049316)
    createVehicle(403, x+8, -356, 15,0,0,75)
end
addEventHandler("onPlayerResourceStart", root, setCameraOnPlayerJoin)