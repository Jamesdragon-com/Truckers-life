-- Function to create the main menu GUI
function createMainMenuGUI()
    showCursor(true)
    -- Create the main menu window
    local screenWidth, screenHeight = guiGetScreenSize()
    local windowWidth, windowHeight = 400, 300  -- Adjusted window size
    local windowX, windowY = (screenWidth - windowWidth) /1.2, (screenHeight - windowHeight) /2
    local mainWindow = guiCreateWindow(windowX, windowY, windowWidth, windowHeight, "Truckers life 1", false)
    
    -- Create buttons for menu options
    local buttonHeight = 40  -- Increased button height
    local buttonPadding = 15
    local buttonWidth = windowWidth - 2 * buttonPadding
    local buttonX = buttonPadding
    local buttonY = 70
    
    local joinButton = guiCreateButton(buttonX, buttonY, buttonWidth, buttonHeight, "Get a job", false, mainWindow)
    addEventHandler("onClientGUIClick", joinButton, function()
        -- Implement logic to join the truck server
        -- For example: triggerServerEvent("onPlayerJoinTruckServer", localPlayer)
        outputChatBox("You clicked the 'Join Truck Server' button.", 0, 255, 0)
    end, false)
    
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
end

-- Call createMainMenuGUI when the resource starts
addEventHandler("onClientResourceStart", resourceRoot, createMainMenuGUI)
