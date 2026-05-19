local nui_ready = promise.new()

local ServerState = {
    gameStart = false,
    remainingTime = 0,
    players = {}
}
local PlayerState = {
    ingame = false,
    currentQuiz = 0,
    score = 0
}

ESX = nil

ResourceName = GetCurrentResourceName()

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent(Config["esx_routers"]['getSharedObject'], function(obj) ESX = obj end)
        Citizen.Wait(250)
    end
end)

TriggerNUI = function(action, data)
    Citizen.CreateThread(function()
        data = data or {}
        data.action = action
        Citizen.Await(nui_ready)
        SendNUIMessage(data)
    end)
end
RegisterNUICallback('ready', function(_, cb)
    nui_ready:resolve()
    cb('ok')
end)

RegisterNUICallback('CloseMenu', function(_, cb)
    SetNuiFocus(false, false)
end)

RegisterNUICallback('answer', function(data, cb)
    if data.correct then
        PlayerState.score = PlayerState.score + 1
        TriggerServerEvent(ResourceName..":SV:Answer")
    end
    if PlayerState.currentQuiz < Config.MaxQuiz then
        PlayerState.currentQuiz = PlayerState.currentQuiz + 1
        TriggerNUI('UpdateQuiz', {
            quiz = PlayerState.quiz[PlayerState.currentQuiz],
            time = Config.questionTime,
            score = PlayerState.score
        })
    else
        TriggerNUI('ShowScore', {
            score = PlayerState.score,
            MaxQuiz = Config.MaxQuiz
        })
        Citizen.Wait(3000)
        TriggerServerEvent(ResourceName..":SV:GetRewards")
    end
end)

Citizen.CreateThread(function()
	while true do
		if NetworkIsPlayerActive(PlayerId()) then
			Citizen.Wait(Config.LoadedTime)
			TriggerServerEvent(ResourceName..":SV:GetData")
			break
		end
		Wait(0)
	end
end)

RegisterNetEvent(ResourceName..":CL:gameStart")
AddEventHandler(ResourceName..":CL:gameStart", function(i)
    ServerState.remainingTime = GetGameTimer() + (i.remainingTime - i.currentTime)
    ServerState.gameStart = true
    PlayerState.ingame = false
    updateTimeRemaining()
end)

updateTimeRemaining = function()
    exports["Hype_AllMenu"]:UpdateEvent('quiz', true)
    local Tiemdelay = (ServerState.remainingTime - GetGameTimer()) / 1000
    TriggerNUI('Alert', {
        time = secondsToClock(Tiemdelay)
    })
    Citizen.CreateThread(function()
        while ServerState.gameStart do
            local Tiemdelay = (ServerState.remainingTime - GetGameTimer()) / 1000
            if Tiemdelay > 0 then
                TriggerNUI("updateTime", {
                    time = secondsToClock(Tiemdelay)
                })
            else
                ServerState.remainingTime = 0
                ServerState.gameStart = false
                TriggerNUI('Close')
                exports["Hype_AllMenu"]:UpdateEvent('quiz', false)
            end
            Citizen.Wait(1000)
        end
    end)
    local toggle = false
    Citizen.CreateThread(function()
        while ServerState.gameStart do
            if IsPauseMenuActive() then
                if not toggle then
                    toggle = true
                    TriggerNUI('Close')
                end
            else
                if toggle then
                    toggle = false
                    TriggerNUI('OpenUi')
                end
            end
            Citizen.Wait(500)
        end
    end)

end
secondsToClock = function(seconds)
    local hours = string.format("%02.f", math.floor(seconds / 3600))
    local mins = string.format("%02.f", math.floor(seconds / 60 - (hours * 60)))
    local secs = string.format("%02.f", math.floor(seconds - hours * 3600 - mins * 60))
	if hours == "00" then
		return mins .. ':' .. secs
	else
		return hours.. ':' .. mins .. ':' .. secs
	end
end

RegisterCommand("quiz", function()
    if not ServerState.gameStart then return end
    if PlayerState.ingame then return end
    PlayerState.ingame = true
    TriggerServerEvent(ResourceName..":SV:joinQuiz")
    TriggerNUI('Close')
    exports["Hype_AllMenu"]:UpdateEvent('quiz', false)
    StartQuiz()
end)

local function shuffle(t)
    for i = #t, 2, -1 do
        local j = math.random(i)
        t[i], t[j] = t[j], t[i]
    end
end

local function getRandomQuiz(cfg)
    -- 1) สร้างรายการ index แล้วสับลำดับคำถาม
    local index = {}
    for i = 1, #cfg.Quiz do
        index[i] = i
    end
    shuffle(index)

    -- 2) ดึงตามจำนวนที่ต้องการ
    local amount = math.min(cfg.MaxQuiz, #cfg.Quiz)
    local set = {}

    for k = 1, amount do
        local q = cfg.Quiz[index[k]]   -- อ้างถึงตารางคำถามเดิม
        shuffle(q.answer)              -- 🔸 สลับตำแหน่ง answer ตรงนี้เลย
        set[#set + 1] = q
    end
    return set
end

StartQuiz = function()
    math.randomseed(GetGameTimer())
    -- ==== ตัวอย่างการใช้งาน ====
    PlayerState.quiz = getRandomQuiz(Config)   -- ได้ตู้คำถามแบบไม่ซ้ำแล้ว
    PlayerState.currentQuiz = 1
    PlayerState.score = 0
    TriggerNUI('UpdateQuiz', {
        quiz = PlayerState.quiz[PlayerState.currentQuiz],
        time = Config.questionTime,
        score = PlayerState.score
    })
    TriggerNUI('Open', {
        MaxQuiz = Config.MaxQuiz
    })
    SetNuiFocus(true, true)
end