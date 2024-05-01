function showVehicleName(theVehicle)
    local thePlayer = getVehicleOccupant(theVehicle)
    if thePlayer then
        outputChatBox("Name of the Vehicle: " .. getVehicleName(theVehicle), thePlayer)
    else
        outputChatBox("The vehicle is empty!", 255, 0, 0, true)
        -- Trigger the client event to show the warning message
        triggerClientEvent(root, "showWarningMsg", resourceRoot)
    end
end

addEventHandler("onVehicleExit", root, showVehicleName)

function hideWarningMsg(thePlayer)
    triggerClientEvent(thePlayer, "hideWarningMsg", resourceRoot)
end

addEventHandler("onVehicleEnter", root, hideWarningMsg)
