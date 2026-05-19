config.functions.Bridge = {}

config.functions.OnPlayerTakeWinnerItems = function(airdrop_name, playerId, item, amount)
    ---@param airdrop_name string
	---@param playerId number
	---@param item table
	---@param amount number

    local message = string.format('เก็บ [%s] จำนวน [%s] ชิ้น | จาก Airdrop %s', item.account or item.name, amount, airdrop_name)
    TriggerEvent('azael_dc-serverlogs:sendToDiscord', 'giveReward', message, playerId, '^4') ;
end

config.functions.OnPlayerTakeSharedItems = function(airdrop_name, playerId, item, amount)
    ---@param airdrop_name string
	---@param playerId number
	---@param item table
	---@param amount number

    local message = string.format('ได้รับ [%s] จำนวน [%s] ชิ้น | จาก Airdrop %s | แชร์ไอเท็ม', item.account or item.name, amount, airdrop_name)
    TriggerEvent('azael_dc-serverlogs:sendToDiscord', 'giveReward', message, playerId, '^4') 
end

config.functions.OnPlayerTakeJoinedItems = function(airdrop_name, playerId, item, amount)
    ---@param airdrop_name string
	---@param playerId number
	---@param item table
	---@param amount number

    local message = string.format('ได้รับรางวัลเข้าร่วม [%s] จำนวน [%s] ชิ้น | จาก Airdrop %s', item.account or item.name, amount, airdrop_name)
    TriggerEvent('azael_dc-serverlogs:sendToDiscord', 'giveReward', message, playerId, '^4') 
end

config.functions.Bridge.GetPlayerFromId = function(...)
    -- // Pre Load ESX
	---@param playerId number
    local playerId = ...
    local xPlayer, attmp = ESX.GetPlayerFromId(playerId), 0;

    while (xPlayer == nil) and (attmp <= 100) do
        xPlayer = ESX.GetPlayerFromId(playerId)
        attmp += 1;
        Wait(100)
    end

    if (xPlayer == nil) then
        print("player id " .. playerId .. " does exit")
    end

    return xPlayer
end

config.functions.Bridge.SetTimeout = function(...)
    return ESX.SetTimeout(...)
end

config.functions.Bridge.ClearTimeout = function(...)
    return ESX.ClearTimeout(...)
end

config.functions.Bridge.DumpTable = function(...)
    return ESX.DumpTable(...)
end

config.functions.Bridge.GetItemLabel = function(item)
	---@param item string
    return ESX.GetItemLabel(item)
end

config.functions.Bridge.GetAccountLabel = function(account)
	---@param account string
    return account == "money" and "Money" or account == "black_money" and "Black Money"
end

config.functions.Bridge.xPlayer = {
    addAccountMoney = function(xPlayer, ...)
        ---@param xPlayer table
        return xPlayer.addAccountMoney(...)
    end,
    addInventoryItem = function(xPlayer, ...)
        ---@param xPlayer table
        return xPlayer.addInventoryItem(...)
    end,
    playerId = function(xPlayer)
        ---@param xPlayer table
        return xPlayer.playerId
    end,
    getName = function(xPlayer)
        ---@param xPlayer table
        return xPlayer.getName()
    end,
    getInventoryItem = function(xPlayer, ...)
        ---@param xPlayer table
        return xPlayer.getInventoryItem(...)
    end,
    getJob = function(xPlayer, ...)
        ---@param xPlayer table
        return xPlayer.getJob(...)
    end,
    identifier = function(xPlayer)
        ---@param xPlayer table
        return xPlayer.identifier
    end,
}