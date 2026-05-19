local InWarzone = false
local TimeRemaining = 0

ESX = nil
script_name = GetCurrentResourceName()

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent(Config["esx_routers"]['getSharedObject'], function(obj) ESX = obj end)
        Citizen.Wait(250)
    end
end)

CreateThread(function()
	while true do
		if NetworkIsPlayerActive(PlayerId()) then
			Wait(10000)
			TriggerServerEvent(script_name..":SV:CheckWarzone")
			break
		end
		Wait(0)
	end
end)

function OpenFreezeMenu()
    local elements = {
        {label = "ปลดล็อคตัวละคร", value = 'BUBBU'},
    }

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'es_extended_freezemap', {
        title    = "HYPE TOWN",
        align    = 'center',
        elements = elements
    }, function(data, menu)
        if data.current.value == 'BUBBU' then
            menu.close()
            FreezeEntityPosition(PlayerPedId(), false) -- ปลดล็อกตำแหน่ง
        end
    end, function(data, menu)
        menu.close()
        FreezeEntityPosition(PlayerPedId(), false) -- ปลดล็อกตำแหน่ง
    end)
end

Citizen.CreateThread(function() 
    for k, v in pairs(Config["General"].Warp) do
        if v.Blips ~= nil then
            local blip = AddBlipForCoord(vector3(v.Coords.x, v.Coords.y, v.Coords.z))
            local name = v.Blips.Text
            SetBlipSprite (blip, v.Blips.Sprite)
            SetBlipDisplay(blip, 4)
            SetBlipScale  (blip, v.Blips.Scale)
            SetBlipColour (blip, v.Blips.Color)
            SetBlipAsShortRange(blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(name)
            EndTextCommandSetBlipName(blip)
        end
        -- RequestModel(v.Model)
        -- while not HasModelLoaded(v.Model) do
        --     Wait(1)
        -- end
        -- local x, y, z, h = table.unpack(v.Coords)
        -- local pedCreate =  CreatePed(4, v.Model, x, y, z-1, 3374176, false, true)
        -- -- local pedCreate = exports["XNS-NPCSkin"]:CreatePedSkinVec4("Warzone", v.Coords)
        -- SetEntityHeading(pedCreate, h)
        -- FreezeEntityPosition(pedCreate, true)
        -- SetEntityInvincible(pedCreate, true)
        -- SetBlockingOfNonTemporaryEvents(pedCreate, true)
    end
end)

Citizen.CreateThread(function()
    Citizen.Wait(3000)
    local toggle = false
    local inzone = false
    while true do
        local sleep = 1000
        ped = PlayerPedId()
        inzone = false
        if IsPedOnFoot(PlayerPedId()) and not InWarzone then
            local PlayerCoords = GetEntityCoords(ped)
            for k, v in pairs(Config["General"].Warp) do
                local Coords = vector3(v.Coords.x, v.Coords.y, v.Coords.z)
                if #(PlayerCoords - Coords) < 2.5 then
                    inzone = true
                    sleep = 0
                        --  exports["next_textui"]:ShowHelpNotification(" PRESS ~INPUT_CONTEXT~ GO TO Warzone")
                    if not toggle then
                        toggle = true
                        -- exports["next_textui"]:ShowHelpNotificationToggle(v.HelpText)
                    end
                    if IsControlJustReleased(0, 38) then
                        -- TimeRemaining = Config["General"].TimeOnline
                        JoinWarzone(1)
                        Citizen.Wait(1000)
                    end
                end
            end
        end
        if not inzone then
            if toggle then
                toggle = false
                -- exports["next_textui"]:ClearHelpNotification()
            end
        end
        Citizen.Wait(sleep)
    end
end)




JoinWarzone = function(map)
    for k, v in pairs(Config["Warp"]) do
        if k == map then
            InWarzone = true
            TriggerServerEvent(script_name..":SV:JoinWarzone")
            -- TriggerServerEvent("Hype_Dimension:SV:CHANGEDIMENSION", 1)
            Citizen.Wait(1000)
            SendNUIMessage {
                action = "JoinWarzone"
            }
            Teleport(v.Coords, {
                Health = 200,
                Armour = 0
            })
        end
    end
    Citizen.CreateThread(function()
        while InWarzone do
            local sleep = 1000
            local ped = PlayerPedId()
            local PlayerCoords = GetEntityCoords(ped)
            local Coords = vector3(-3897.72, -4067.8, 306.92)
            if #(PlayerCoords - Coords) > 300 then
                TriggerServerEvent(script_name..":SV:CheckWarzone")
                break
            end
            Citizen.Wait(sleep)
        end
    end)
end

-- JoinWarzone = function(map)
--     for k, v in pairs(Config["Warp"]) do
--         if k == map then
--             InWarzone = true
--             TriggerServerEvent(script_name..":SV:JoinWarzone")
--             Citizen.Wait(1000)
--             SendNUIMessage {
--                 action = "JoinWarzone"
--             }
--             Teleport(v.Coords, {
--                 Health = 200,
--                 Armour = 0
--             })
--         end
--     end
--     Citizen.CreateThread(function()
--     local warzoneCenter = vector3(-3897.72, -4067.8, 306.92)
--     local maxDistance = 1000.0

--     while true do
--         if InWarzone then
--             local ped = PlayerPedId()
--             local coords = GetEntityCoords(ped)
--             local distance = #(coords - warzoneCenter)

--             if distance > maxDistance then
--                 TriggerServerEvent(script_name..":SV:CheckWarzone")
--                 break
--             end

--             local wait = distance > (maxDistance - 100) and 2000 or 10000
--             Citizen.Wait(wait)
--         else

--             Citizen.Wait(1000)
--         end
--     end
-- end)
-- end

RegisterCommand('OpenShopWarzone', function()
    if InWarzone then
        SendNUIMessage {
            action = "OpenShop",
            bonus = Config["General"].Item,
            weapons = Config["Weapon"]
        }
        SetNuiFocus(true, true)
    end
end, false)

RegisterKeyMapping('OpenShopWarzone', 'OpenShop', 'keyboard', 'G')

function Teleport(coords, status)
    Citizen.Wait(1000)
    OpenFreezeMenu()
    FreezeEntityPosition(PlayerPedId(), true)
	SetEntityCoords(PlayerPedId(), coords)
    SetStatuts(status.Health, status.Armour)
end

function SetStatuts(Health, Armour)
    if IsPedDeadOrDying(PlayerPedId()) then
        TriggerEvent(Config["esx_routers"]['revive'])
    end
    Citizen.Wait(1000)
    SetEntityHealth(PlayerPedId(), Health)
    SetPedArmour(PlayerPedId(), Armour)
end

RegisterNUICallback("CloseMenu", function(data, cb)
    SetNuiFocus(false, false)
end)

RegisterNUICallback("Buy", function(data, cb)
    if data.Select == "Weapons" then
        for k, v in pairs(Config["Weapon"]) do
            if v.Name == data.Name then
                if Checkmoney(v.Price) then
                    TriggerServerEvent(script_name..":SV:BuyItem", {
                        Name = v.Name,
                        Price = v.Price,
                        Type = "weapon"
                    })
                else
                    sendNotifyCL(("ต้องการเงินจำนวน %s"):format(v.Price), "error")
                end
            end
        end
    elseif data.Select == "Items" then
        for k, v in pairs(Config["Item"]) do
            if v.Name == data.Name then
                if Checkmoney(v.Price) then
                    TriggerServerEvent(script_name..":SV:BuyItem", {
                        Name = v.Name,
                        Price = v.Price,
                        Type = "item"
                    })
                else
                    sendNotifyCL(("ต้องการเงินจำนวน %s"):format(v.Price), "error")
                end
            end
        end
    elseif data.Select == "Warps" then
        for k, v in pairs(Config["Warp"]) do
            if v.Label == data.Name then
                TriggerServerEvent("Hype_Dimension:SV:CHANGEDIMENSION", v.Zone)
            end
        end
    end
end)

RegisterNUICallback("SelectMenu", function(data, cb)
    if data.Select == "Weapons" then
        SendNUIMessage {
            action = "UpdateData",
            data = Config["Weapon"]
        }
    elseif data.Select == "Items" then
        SendNUIMessage {
            action = "UpdateData",
            data = Config["Item"]
        }
    elseif data.Select == "Warps" then
        SendNUIMessage {
            action = "UpdateDataWarps",
            data = Config["Warp"]
        }
    elseif data.Select == "Exit" then
        TriggerServerEvent(script_name..":SV:ExitWarzone")
    end
end)

function Checkmoney(count)
    for key, value in pairs(ESX.GetPlayerData().accounts) do
        if ESX.GetPlayerData().accounts[key].name == "money" then
            local Money = ESX.GetPlayerData().accounts[key].money
            if tonumber(Money) >= count then
                return true
            end
        end
    end
    return false
end

RegisterNetEvent(script_name..":CL:ExitWarzone")
AddEventHandler(script_name..":CL:ExitWarzone", function(data)
    InWarzone = false
    Teleport(vector3(data.Coords.x, data.Coords.y, data.Coords.z), {
        Health = data.Status.Health,
        Armour = data.Status.Armour
    })
    SendNUIMessage {
        action = "Exit"
    }
end)

function secondsToClock(seconds)
    local hours = string.format("%02.f", math.floor(seconds / 3600))
    local mins = string.format("%02.f", math.floor(seconds / 60 - (hours * 60)))
    local secs = string.format("%02.f", math.floor(seconds - hours * 3600 - mins * 60))
    return mins .. ':' .. secs
end

function GetEvent()
    return InWarzone
end

exports('GetEvent', GetEvent)