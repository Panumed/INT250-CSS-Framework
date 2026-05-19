config.events = {
    playerDropped = "esx:playerDropped"
}

config.framework = function()
    while (ESX == nil) do
        TriggerEvent("esx:getSharedObject", function(cb)
            ESX = cb
        end)
        Wait(100)
    end
    return ESX
end;