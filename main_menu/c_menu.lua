
local screenWidth, screenHeight = guiGetScreenSize()
local windowWidth, windowHeight = 400, 300  -- Adjusted window size
local windowX, windowY = (screenWidth - windowWidth) /1.2, (screenHeight - windowHeight) /2
local job_win
showCursor(true)

    function showwin()
        if job_win then
            destroyElement(job_win)
            job_win = nil -- Reset job_win to nil after destroying the element
        else
            job_w = guiCreateWindow(windowX/2, windowY/2, windowWidth, windowHeight, "Get a job", false)
        end
    end

function createMainMenuGUI()

    -- Create the main menu window
    local mainWindow = guiCreateWindow(windowX, windowY, windowWidth, windowHeight, "Truckers life 1", false)
    
    -- Create buttons for menu options
    local buttonHeight = 40  -- Increased button height
    local buttonPadding = 15
    local buttonWidth = windowWidth - 2 * buttonPadding
    local buttonX = buttonPadding
    local buttonY = 70
    
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
end

-- Call createMainMenuGUI when the resource starts
addEventHandler("onClientResourceStart", root, createMainMenuGUI)


