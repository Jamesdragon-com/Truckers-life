function showWarningMsg()
    local screenWidth, screenHeight = guiGetScreenSize()
    local windowWidth, windowHeight = 600, 80
    local windowX, windowY = (screenWidth - windowWidth) / 2, (screenHeight - windowHeight) / 2

    myWindow = guiCreateWindow(windowX, windowY/0.55, windowWidth, windowHeight * 1.2, "Warning", false)
    guiWindowSetSizable(myWindow, false)
    
    local labelHeight = 0.2 * windowHeight * 1.2
    local labelWidth = 0.94 * windowWidth
    local labelX = windowWidth / 2
    local labelY = windowHeight -- Position the label at the bottom of the window

    warningLabel = guiCreateLabel(labelX, labelY/2, labelWidth, labelHeight, "Return to the truck!!", false, myWindow)
    outputChatBox("this", 100, 100, 100)
end
addEvent("showWarningMsg", true)
addEventHandler("showWarningMsg", resourceRoot, showWarningMsg)

function hideWarningMsg()
    if isElement(myWindow) then
        destroyElement(myWindow)
    end
end
addEvent("hideWarningMsg", true)
addEventHandler("hideWarningMsg", resourceRoot, hideWarningMsg)
