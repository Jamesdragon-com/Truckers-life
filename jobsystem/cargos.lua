-- cargos.lua
local cargoslist = {
    {
        type = "Electronics", 
        from = "Los Santos", 
        to = "Las Vegas", 
        price = 100, 
        deliveryTime = "1 hour",
        sX = 2765.07764,
        sY = -2474.98657,
        sZ = 13.47656,
        tX = 2748.70557, 
        tY = -2464.47314,
        tZ = 12.7,
    },
    {
        type = "Tamr", 
        from = "Los Santos", 
        to = "Desert", 
        price = 100, 
        deliveryTime = "1 hour",
        sX = 0,
        sY = 0,
        sZ = 0,
        tX = 2748.70557, 
        tY = -2464.47314,
        tZ = 13,
    },
}

function test()
    return cargoslist
end

exports.test = test


