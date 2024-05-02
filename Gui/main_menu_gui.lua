-- c_Gui.lua
-- this is a code that manage the player Hud
-- By Meftah
-- Created on 30/04/2024

----- Gui variables ----- 
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
--- main menu buttons variable ---
local joinButton
local optionsButton
local exitButton
----------------------------------
local job_win
local mainWindow 
local gridlist
local veh

local getCargosList = exports.cargos:getCargosList()






showCursor(true)
function createMainMenuGUI()
    --- hide the default hud ---
    setPlayerHudComponentVisible ( "all",false )
    --- main menu window ---
    create_menu("ETS")
    --- Create buttons for menu options ---
    create_buttons("start","options","exit")
    set_scene()
end

function showwin()
    if job_win then
        destroyElement(job_win)
        job_win = nil -- Reset job_win to nil after destroying the element
    else
        job_win = guiCreateWindow(windowX/8, windowY/2, windowWidth, windowHeight*1.2, "select a job", false)
        guiWindowSetSizable(job_win, false)
        create_grid_list()
    end
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
    triggerServerEvent("onServerSendMessage", localPlayer)
end

function cargo_chose(gridlist)
    if not gridlist then
        outputChatBox("Gridlist not found.", 255, 0, 0)
        return
    end

    local selectedRow = guiGridListGetSelectedItem(gridlist)
    if selectedRow ~= -1 then
        local cargoType = guiGridListGetItemText(gridlist, selectedRow, 1)
        local cargoDestination = guiGridListGetItemText(gridlist, selectedRow, 2)
        local cargoPrice = tonumber(guiGridListGetItemText(gridlist, selectedRow, 3))
        local cargoDeliveryTime = guiGridListGetItemText(gridlist, selectedRow, 4)

        -- Trigger an event to the server to handle cargo acceptance
        triggerServerEvent("onPlayerAcceptCargo", localPlayer, cargoType, cargoDestination, cargoPrice, cargoDeliveryTime)
    else
        outputChatBox("Please select a cargo to accept.", 255, 0, 0)
    end
end

function create_menu(win_title)
   -- Create the main menu window
   mainWindow = guiCreateWindow(windowX, windowY, windowWidth, windowHeight, win_title, false)
end

function create_buttons(j_btn,o_btn,e_btn)
    joinButton = guiCreateButton(buttonX, buttonY, buttonWidth, buttonHeight, j_btn, false, mainWindow)
    addEventHandler ( "onClientGUIClick", joinButton, function()
    outputChatBox("You clicked the 'Get a job' button.", 0, 255, 0)
    showwin()
end, false )

    optionsButton = guiCreateButton(buttonX, buttonY + buttonHeight + buttonPadding, buttonWidth, buttonHeight, o_btn, false, mainWindow)
    addEventHandler("onClientGUIClick", optionsButton, function()
        -- Implement logic to open options menu
        outputChatBox("You clicked the 'Options' button.", 0, 255, 0)
    end, false)
    
    exitButton = guiCreateButton(buttonX, buttonY + 2 * (buttonHeight + buttonPadding), buttonWidth, buttonHeight, e_btn, false, mainWindow)
    addEventHandler("onClientGUIClick", exitButton, function()
        -- Implement logic to exit the game
        outputChatBox("You clicked the 'Exit' button.", 0, 255, 0)
    end, false)
end
--function to create the grid list of the cargos
function create_grid_list()
    gridlist = guiCreateGridList(0.05, 0.1, 0.9, grid_height, true, job_win)
    guiGridListAddColumn(gridlist, "Type", 0.25)
    guiGridListAddColumn(gridlist, "Destination", 0.35)
    guiGridListAddColumn(gridlist, "Price", 0.2)
    guiGridListAddColumn(gridlist, "Delivery Time", 0.2)
    
    -- Retrieve cargos list from the exported function
    
    -- Fill the grid list with cargos information
    if getCargosList then
     for _, cargo in ipairs(getCargosList) do
        local row = guiGridListAddRow(gridlist)
        guiGridListSetItemText(gridlist, row, 1, cargo.type, false, false)
        guiGridListSetItemText(gridlist, row, 2, cargo.from, false, false) -- Adjusted to "To" instead of "destination"
        guiGridListSetItemText(gridlist, row, 3, tostring(cargo.price), false, false)
        guiGridListSetItemText(gridlist, row, 4, cargo.deliveryTime, false, false)
       
      end
    else 
      outputChatBox("Error", 255, 255, 255)
    end

    local buttonWidth, buttonHeight = 100, 30
    local buttonX, buttonY = (windowWidth - buttonWidth) / 1.05, windowHeight+5
    local okButton = guiCreateButton(buttonX, buttonY, buttonWidth, buttonHeight, "OK", false, job_win)
    addEventHandler("onClientGUIClick", okButton, function()
        spawnPlayer()
        if gridlist then
        cargo_chose(gridlist)
        end
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