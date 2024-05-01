function showVehicleName(theVehicle)
    local thePlayer = getVehicleOccupant(theVehicle)
    if thePlayer then
        outputChatBox("Name of the Vehicle: " .. getVehicleName(theVehicle), thePlayer)
    else
        -- Trigger the client event to show the warning message
        triggerClientEvent(root, "showWarningMsg", resourceRoot)
    end
end

function handleVehicleExit(thePlayer, seat, jacked)
    if not jacked then -- Check if the player exited voluntarily
        local theVehicle = source
        showVehicleName(theVehicle)
    end
end

addEventHandler("onVehicleExit", root, handleVehicleExit)
function handleVehicleEnter(thePlayer, seat, jacked)
    if seat == 0 then -- Only trigger if the player is the driver
        local theVehicle = source
        triggerClientEvent(thePlayer, "hideWarningMsg", resourceRoot)
    end
end

addEventHandler("onVehicleEnter", root, handleVehicleEnter)

