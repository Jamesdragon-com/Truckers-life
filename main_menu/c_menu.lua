
local screenWidth, screenHeight = guiGetScreenSize()
local windowWidth, windowHeight = 400, 300  -- Adjusted window size
local windowX, windowY = (screenWidth - windowWidth) /1.2, (screenHeight - windowHeight) /2
local buttonHeight = 40  -- Increased button height
local buttonPadding = 15
local buttonWidth = windowWidth -15
local buttonX = buttonPadding
local buttonY = 70
local buttonZ, buttonE = (windowWidth - buttonWidth) / 2, (windowHeight - buttonHeight )/0.7
local grid_height=0.6
local job_win
local mainWindow 
local veh
local cargoInfo = {
    {type = "Electronics", destination = "Los Santos", price = 100, deliveryTime = "1 hour"},
    {type = "Clothing", destination = "San Fierro", price = 80, deliveryTime = "45 minutes"},
    {type = "Food", destination = "Las Venturas", price = 120, deliveryTime = "1.5 hours"}
}
showCursor(true)

function showwin()
    if job_win then
        destroyElement(job_win)
        job_win = nil -- Reset job_win to nil after destroying the element
    else
        job_win = guiCreateWindow(windowX/8, windowY/2, windowWidth, windowHeight*1.2, "Get a job", false)
        guiWindowSetSizable(job_win, false)
            
        local gridlist = guiCreateGridList(0.05, 0.1, 0.9, grid_height, true, job_win)
        guiGridListAddColumn(gridlist, "Type", 0.25)
        guiGridListAddColumn(gridlist, "Destination", 0.35)
        guiGridListAddColumn(gridlist, "Price", 0.2)
        guiGridListAddColumn(gridlist, "Delivery Time", 0.2)
        for _, cargo in ipairs(cargoInfo) do
            local row = guiGridListAddRow(gridlist)
            guiGridListSetItemText(gridlist, row, 1, cargo.type, false, false)
            guiGridListSetItemText(gridlist, row, 2, cargo.destination, false, false)
            guiGridListSetItemText(gridlist, row, 3, tostring(cargo.price), false, false)
            guiGridListSetItemText(gridlist, row, 4, cargo.deliveryTime, false, false)
        end

        local buttonWidth, buttonHeight = 100, 30
        local buttonX, buttonY = (windowWidth - buttonWidth) / 1.05, windowHeight+5
        local okButton = guiCreateButton(buttonX, buttonY, buttonWidth, buttonHeight, "OK", false, job_win)
        addEventHandler("onClientGUIClick", okButton, function()
            spawnPlayer()
        end, false)
        
        local labelWidth, labelHeight = 0.9 * windowWidth, 0.15 * windowHeight
        local labelX, labelY = -(windowWidth - labelWidth) ,  windowHeight - grid_height
        local label = guiCreateLabel(labelX, labelY, labelWidth, labelHeight, "", false, job_win)
        guiLabelSetHorizontalAlign(label, "center", true)

        addEventHandler("onClientGUIClick", gridlist, function()
            local selectedRow = guiGridListGetSelectedItem(gridlist)
            if selectedRow ~= -1 then
                local type = guiGridListGetItemText(gridlist, selectedRow, 1)
                local destination = guiGridListGetItemText(gridlist, selectedRow, 2)
                local price = guiGridListGetItemText(gridlist, selectedRow, 3)
                local deliveryTime = guiGridListGetItemText(gridlist, selectedRow, 4)
                
                local itemInfo = "Type: " .. type .. "\nDestination: " .. destination .. "\nPrice: " .. price .. "\nDelivery Time: " .. deliveryTime
                guiSetText(label, itemInfo)
            else
                guiSetText(label, "")
            end
        end, false)
    end
end


function createMainMenuGUI()

    -- Create the main menu window
     mainWindow = guiCreateWindow(windowX, windowY, windowWidth, windowHeight, "Truckers life 1", false)
    
    -- Create buttons for menu options
   
    
    local joinButton = guiCreateButton(buttonX, buttonY, buttonWidth, buttonHeight, "Get a job", false, mainWindow)
    addEventHandler ( "onClientGUIClick", joinButton, function()
    outputChatBox("You clicked the 'Get a job' button.", 0, 255, 0)
    showwin()
end, false )

    local optionsButton = guiCreateButton(buttonX, buttonY + buttonHeight + buttonPadding, buttonWidth, buttonHeight, "Options", false, mainWindow)
    addEventHandler("onClientGUIClick", optionsButton, function()
        -- Implement logic to open options menu
        outputChatBox("You clicked the 'Options' button.", 0, 255, 0)
    end, false)
    
    local exitButton = guiCreateButton(buttonX, buttonY + 2 * (buttonHeight + buttonPadding), buttonWidth, buttonHeight, "Exit", false, mainWindow)
    addEventHandler("onClientGUIClick", exitButton, function()
        -- Implement logic to exit the game
        outputChatBox("You clicked the 'Exit' button.", 0, 255, 0)
    end, false)
    set_scene()
end

-- Call createMainMenuGUI when the resource starts
addEventHandler("onClientResourceStart", getResourceRootElement(), createMainMenuGUI)


function spawnPlayer() 
outputChatBox("You clicked the 'ok' button.", 0, 255, 0)
if job_win then 
    destroyElement(mainWindow)
    destroyElement(job_win)
    fadeCamera ( false,0.5, 255, 255, 255 )
    setTimer(delay_spawn, 1000, 1)
    setTimer(myDelayedFunction, 3000, 1)
    showCursor(false)

end
end
function myDelayedFunction()
    destroyElement(veh)
    fadeCamera ( true,0.2 )
end

function set_scene()
    fadeCamera(true, 2)
    -- set the player's camera to a fixed position, looking at a fixed point
    x = -1675
    y = -356
    z = 15
    setCameraMatrix(x , y ,z, 1468.388671875, -918.42474365234, 99.881813049316)
    veh =createVehicle(403, x+8, -356, 15,0,0,75)
end
function delay_spawn()
    triggerServerEvent("onServerSendMessage", localPlayer) -- refer to the note on wiki page (under theElement), for understanding which element you should use as 2nd argument
end



