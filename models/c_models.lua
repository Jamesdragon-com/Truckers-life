local models = {
    {
        dffFile = "scania/scania.dff",
        txdFile = "scania/scania.txd",
        modelID = 403,
    },
    -- Add more models here if needed
}

function replace_models()
    for _, data in ipairs(models) do
        local txd = engineLoadTXD(data.txdFile)
        if txd then
            engineImportTXD(txd, data.modelID)
        else
            outputChatBox("Failed to load TXD file for car ID " .. data.modelID, 255, 0, 0)
        end
    
        local dff = engineLoadDFF(data.dffFile, data.originalID)
        if dff then
            engineReplaceModel(dff, data.modelID)
        else
            outputChatBox("Failed to load DFF file for car ID " .. data.modelID, 255, 0, 0)
        end
    end
end 
addEventHandler("onClientResourceStart", getRootElement(), replace_models) 
