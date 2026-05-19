ESX = nil
ResourceName = GetCurrentResourceName()

TriggerEvent(Config["esx_routers"]['getSharedObject'], function(obj) ESX = obj end)

local ServerState = {
    gameStart = false,
    remainingTime = 0,
    players = {}
}

RegisterServerEvent(ResourceName..":SV:GetData")
AddEventHandler(ResourceName..":SV:GetData", function()
    if not ServerState.gameStart then return end
    local xPlayer = ESX.GetPlayerFromId(source)
    if not ServerState.players[xPlayer.identifier] then
        TriggerClientEvent(ResourceName..":CL:gameStart", xPlayer.source, {
            currentTime = GetGameTimer(),
            remainingTime = ServerState.remainingTime
        })
    end
end)

-- randomQuiz()

randomQuiz = function()
    ServerState.players = {}
    ServerState.gameStart = true
    ServerState.remainingTime = GetGameTimer() + Config.endTime
    TriggerClientEvent(ResourceName..":CL:gameStart", -1, {
        currentTime = GetGameTimer(),
        remainingTime = ServerState.remainingTime
    })
    SetTimeout(Config.endTime, endQuiz)
    SetTimeout(Config.randomTime, randomQuiz)
end

endQuiz = function()
    ServerState.gameStart = false
end

SetTimeout(Config.randomTime, randomQuiz)

RegisterServerEvent(ResourceName..":SV:joinQuiz")
AddEventHandler(ResourceName..":SV:joinQuiz", function()
    if not ServerState.gameStart then return end
    local xPlayer = ESX.GetPlayerFromId(source)
    if not ServerState.players[xPlayer.identifier] then
        ServerState.players[xPlayer.identifier] = {
            score = 0,
            getitem = false
        }
    end
end)

RegisterServerEvent(ResourceName..":SV:Answer")
AddEventHandler(ResourceName..":SV:Answer", function()
    local xPlayer = ESX.GetPlayerFromId(source)
    if ServerState.players[xPlayer.identifier] then
        ServerState.players[xPlayer.identifier].score = ServerState.players[xPlayer.identifier].score + 1
    end
end)

RegisterServerEvent(ResourceName..":SV:Answer")
AddEventHandler(ResourceName..":SV:Answer", function()
    local xPlayer = ESX.GetPlayerFromId(source)
    if ServerState.players[xPlayer.identifier] and not ServerState.players[xPlayer.identifier].getitem then
        if Config.Rewards[ServerState.players[xPlayer.identifier].score] then
            for k, item in pairs(Config.Rewards[ServerState.players[xPlayer.identifier].score]) do
                local amount = item.amount
                if type(amount) == "table" then
                    amount = math.random(amount[1], amount[2])    -- ถ้าเป็น {min,max}
                end
                if item.item == 'money' then
                    xPlayer.addMoney(amount)
                else
                    xPlayer.addInventoryItem(item.item, amount)
                end
            end
            ServerState.players[xPlayer.identifier].getitem = true
        end
    end
end)

-- randomQuiz()