config.functions.Ultils = {}
config.functions.Bridge = {}

---@description function นี้ทำงานก่อนโหลด API ครั้งแรก
config.functions.PlayerLoaded = function()
	while not ESX.IsPlayerLoaded() do
		Wait(1000)
	end
end

---@description function นี้ใช้ในการแสดง Notification
config.functions.Notify = function(message)
	---@param message string

	ESX.ShowNotification(message, 'warning')
end

---@description function นี้จะทำงานเมื่อ Airdrop เริ่ม (ทำงานเฉพาะผู้เล่นที่อยู่ใน Airdrop เท่านั้น)
config.functions.OnAirdropStart = function(airdropName)
	---@param airdropName string

end

---@description function นี้จะทำงานเมื่อ Airdrop จบ (ทำงานเฉพาะผู้เล่นที่อยู่ใน Airdrop เท่านั้น)
config.functions.OnAirdropEnd = function(airdropName)
	---@param airdropName string

end

---@description function ชุบผู้เล่น เชื่อมไปยัง
config.functions.Revive = function()
	TriggerEvent("esx_ambulancejob:revive")
end

config.functions.Teleport = function(coords, type)
	---@param message vector3
	---@param type string [backward: เด้งออกจากวง, reset: เล่นจบ airdrop ส่งกลับที่เดิมและ กดวาปกลับที่เดิมจาก ui, skips: กดวาปจาก ui]
	local playerPed = PlayerPedId()
	FreezeEntityPosition(playerPed, true)
	SetPedCoordsKeepVehicle(playerPed, coords.x, coords.y, coords.z + 0.97)
	SetEntityHeading(playerPed, math.random(360.0))
	while not HasCollisionLoadedAroundEntity(playerPed) do
		FreezeEntityPosition(playerPed, true)
		Wait(0)
	end
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'FreezeEntityPosition', {
		title    = 'ระบบกันตกแมพ',
		align    = 'center',
		elements = {
			{label = 'แมพโหลดเสร็จแล้ว', vaule = 's' }
		}
	}, function(data, menu)
		FreezeEntityPosition(playerPed, false)
		menu.close()
	end, function(data, menu)
		FreezeEntityPosition(playerPed, false)
		menu.close()
	end)

	return true
end

config.functions.BeforePlayerCollect = function()
	return true
end

config.functions.PlayerCancelCollect = function()
	config.functions.Notify('ยกเลิกการเก็บ <span class="red"> ...</span>')
end

config.functions.Ultils.Blips = {
	["new"] = function(Object)
		local Position, Radius, Default, Circle in Object;
        local default, circle = AddBlipForCoord(Position), nil
        SetBlipHighDetail(default, true)
        SetBlipSprite (default, Default?.Sprite)
        SetBlipScale  (default, Default?.Scale)
        SetBlipColour (default, Default?.Colour)
        SetBlipAsShortRange(default, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(Default?.Label)
        EndTextCommandSetBlipName(default)
        if Circle then
            circle = AddBlipForRadius(Position, Radius)
            SetBlipColour(circle, Circle?.Colour)
            SetBlipAlpha(circle, Circle?.Alpha)
        end
        return default, circle
	end
}

config.functions.Bridge = {
	GetPlayerData = function(target)
		-- Target Use
		-- [[
		-- 	job,
		-- 	inventory
		-- ]]
		---@param target string
		return ESX.GetPlayerData()[target]
	end,
	DeleteObject = function(...)
		return ESX.Game.DeleteObject(...)
	end,
	getInventoryItem = function(name)
		---@param name string
		local inventory = ESX.GetPlayerData().inventory;
		for _, v in pairs(inventory) do
			if name == v.name then
				return v
			end
		end
		return {}
	end,

}

config.functions.OnUseCommand = function()
	-- เมื่อผู้เล่นพิมพ์ /airdrop หลังจากเช็คเงื่อนไข config.DisableCommandOnEntered แล้วจะเช็คที่ function นี้ต่อ 
	-- หากผ่าน return true หากไม่ผ่าน ให้ return false
	
	return true
end

-- function นี้จะทำงานเมื่อ กำลังจะเดินเข้า หรือ กดปุ่ม Teleport ไป airdrop เอาไว้เช็คอื่นๆเพิ่มเติมว่าจะให้เข้า airdrop ลูกนั้นๆไหม
config.functions.BeforeEnter = function(airdrop, useTeleport)
	-- // ต้องแจ้ง Notofication เอง
	---@param airdrop table
	---@param airdrop.Name string | ชื่อ airdrop
	---@param airdrop.Status string (Starting กำลังเริ่ม) (Started เริ่มไปแล้ว)
	---@param airdrop.Position vector3
	---@param airdrop.Radius table
	---@param useTeleport boolean | ดำเนินการผ่านปุ่ม Teleport ไหม

	return true --// return true ให้เข้า | false ไม่ให้เข้า
end

config.functions.onExit = function(fn, metadata, types)
	---@param fn table
	---@param metadata table
	---@param types string : ประเภทของการออก button_exit (กดออกจากเมนู) | backward (โดนเตะออกเพราะผิดเงื่อนไข อยู่บนรถ, ผู้เล่นเต็ม) | outzone_exit (อยู่ใน airdrop แล้วเดินออก) | system_exit (โดนเตะออกเพราะ airdrop จบแล้ว)

	metadata = metadata or {}
	fn = fn or {}

	if config.translate and config.translate.Default and config.translate.Default.success_notify_loading then
		config.functions.Notify(config.translate.Default.success_notify_loading)
	end

	pcall(fn.revive)
	pcall(fn.visible, math.random(3000, 5000))

	local teleported = true
	if metadata.position then
		local ok, res = pcall(config.functions.Teleport, metadata.position, "reset")
		teleported = ok and (res ~= false)
	end

	if teleported then
		local ped = PlayerPedId()
		if ped and ped ~= 0 and DoesEntityExist(ped) then
			local health = nil
			if config.HealthAfterPlay and config.HealthAfterPlay >= 101 then
				health = config.HealthAfterPlay
			elseif metadata.health and metadata.health > 0 then
				health = metadata.health
			end
			if health then
				SetEntityHealth(ped, health)
			end

			if metadata.armour and config.ArmourAfterPlay == -1 then
				SetPedArmour(ped, metadata.armour)
			elseif type(config.ArmourAfterPlay) == "number" and config.ArmourAfterPlay >= 0 then
				SetPedArmour(ped, config.ArmourAfterPlay)
			end
		end
	end

	Wait(500)

	pcall(fn.resetVariables)

	FreezeEntityPosition(player.ped, false)
end
