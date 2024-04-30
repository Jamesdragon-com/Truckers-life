-- c_Gui.lua
-- this is a code that manage the player Hud
-- By Meftah
-- Created on 30/04/2024


function hide_Gui()
setPlayerHudComponentVisible ( "all",false )
end
addEventHandler("onClientResourceStart", getRootElement(), hide_Gui)