ESX = nil
script_name = GetCurrentResourceName()
TriggerEvent(Config["esx_routers"]['getSharedObject'], function(obj) ESX = obj end)

RegisterServerEvent(script_name..":SV:JoinWarzone")
AddEventHandler(script_name..":SV:JoinWarzone", function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local playerCoords = GetEntityCoords(GetPlayerPed(xPlayer.source))
    local formattedCoords = {x = ESX.Math.Round(playerCoords.x, 1), y = ESX.Math.Round(playerCoords.y, 1), z = ESX.Math.Round(playerCoords.z, 1)}
    local formattedStatus = { Health = GetEntityHealth(GetPlayerPed(xPlayer.source)), Armour = GetPedArmour(GetPlayerPed(xPlayer.source)) }
    MySQL.Async.execute('INSERT INTO xns_event(identifier, coords, status) VALUES (@identifier, @coords, @status)', {
        ['@identifier'] = xPlayer.identifier,
        ['@coords'] = json.encode(formattedCoords),
        ['@status'] = json.encode(formattedStatus)
    })
    SetPlayerRoutingBucket(xPlayer.source, 1)
end)

RegisterServerEvent(script_name..":SV:CheckWarzone")
AddEventHandler(script_name..":SV:CheckWarzone", function()
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer then
        MySQL.Async.fetchAll('SELECT * FROM xns_event WHERE identifier = @identifier', {
            ['@identifier'] = xPlayer.identifier
        }, function(sql)
            if sql[1] ~= nil then
                local Data = {
                    Coords = json.decode(sql[1].coords),
                    Status = json.decode(sql[1].status),
                }
                TriggerClientEvent(script_name..":CL:ExitWarzone", xPlayer.source, Data)
                SetPlayerRoutingBucket(xPlayer.source, 0)
                MySQL.Async.execute('DELETE FROM xns_event WHERE identifier = @identifier',{
                    ['@identifier'] = xPlayer.identifier
                })
                for k, v in pairs(Config["Item"]) do
                    local xItem = xPlayer.getInventoryItem(v.Name)
                    if xItem.count > 0 then
                        xPlayer.setInventoryItem(xItem.name, 0)
                    end
                end
                for k, v in pairs(Config["Weapon"]) do
                    if xPlayer.hasWeapon(string.upper(v.Name)) then
                        xPlayer.removeWeapon(string.upper(v.Name))
                    end
                end
            end
        end)
    end
end)

RegisterServerEvent(script_name..":SV:ExitWarzone")
AddEventHandler(script_name..":SV:ExitWarzone", function()
    local xPlayer = ESX.GetPlayerFromId(source)
    MySQL.Async.fetchAll('SELECT * FROM xns_event WHERE identifier = @identifier', {
        ['@identifier'] = xPlayer.identifier
    }, function(sql)
        if sql[1] ~= nil then
            local Data = {
                Coords = json.decode(sql[1].coords),
                Status = json.decode(sql[1].status),
            }
            TriggerClientEvent(script_name..":CL:ExitWarzone", xPlayer.source, Data)
            MySQL.Async.execute('DELETE FROM xns_event WHERE identifier = @identifier',{
                ['@identifier'] = xPlayer.identifier
            })
            for k, v in pairs(Config["Item"]) do
                local xItem = xPlayer.getInventoryItem(v.Name)
                if xItem.count > 0 then
                    xPlayer.setInventoryItem(xItem.name, 0)
                end
            end
            for k, v in pairs(Config["Weapon"]) do
                if xPlayer.hasWeapon(string.upper(v.Name)) then
                    xPlayer.removeWeapon(string.upper(v.Name))
                end
            end
        end
    end)
    SetPlayerRoutingBucket(source, 0)
end)

-- RegisterServerEvent(script_name..":SV:WarzoneJoin")
-- AddEventHandler(script_name..":SV:WarzoneJoin", function()
--     local xPlayer = ESX.GetPlayerFromId(source)
--     for index, value in pairs(Config["General"].Item) do
--         if math.random(1, 100) <= value.Percent then
--             local xItem = xPlayer.getInventoryItem(value.ItemName)
--             local xItemrdm = value.ItemCount
--             if xItem.limit ~= -1 and xItem.count >= xItem.limit then
--                 TriggerClientEvent('pNotify:SendNotification', source, { type = 'error', text = xItem.label..' เต็ม' })
--             else
--                 if xItem.limit ~= -1 and (xItem.count + xItemrdm) > xItem.limit then
--                     xPlayer.setInventoryItem(xItem.name, xItem.limit)
--                 else
--                     xPlayer.addInventoryItem(xItem.name, xItemrdm)
--                 end
--             end
--         end
--     end
-- end)

local ItemInProcess = {
    'WEAPON_POOLCUEWZ',
    'WEAPON_BOTTLEWZ',
    'painkiller_wz',
    'armor_wz',
    'aed_wz',
}

RegisterServerEvent(script_name..":SV:BuyItem")
AddEventHandler(script_name..":SV:BuyItem", function(data)
    local xPlayer = ESX.GetPlayerFromId(source)
    local NotBlackList = false
    for k, v in pairs(ItemInProcess) do
        if data.Name == v then
            NotBlackList = true
            break
        end
    end
    if NotBlackList then
        if data.Type == "item" then
            local xItem = xPlayer.getInventoryItem(data.Name)
            if xItem.count > 0 then
                TriggerClientEvent('pNotify:SendNotification', xPlayer.source, { type = 'error', text = "มีไอเทมนี้อยู่แล้ว" })
            else
                xPlayer.removeAccountMoney('money', data.Price)
                xPlayer.addInventoryItem(data.Name, 1)
            end
        elseif data.Type == "weapon" then
            if xPlayer.hasWeapon(string.upper(data.Name)) then
                TriggerClientEvent('pNotify:SendNotification', xPlayer.source, { type = 'error', text = "มีอาวุธนี้อยู่แล้ว" })
            else
                xPlayer.removeAccountMoney('money', data.Price)
                xPlayer.addWeapon(data.Name, 1)
            end
        end
    end
end)