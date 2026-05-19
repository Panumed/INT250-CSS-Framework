config.airdrops[#config.airdrops + 1] = {
	Name = "แกงค์ T.1",
	Teleport = true,
	Sound = "explosion",
	Image = {
    	Starting = 'airdrop', 
	    Started = 'airdrop',
    },
	Position = {                          
		vector3(1206.52, -371.42, 68.90)
	},
	AutoTime = {              
		'01:13', '19:30', '23:00',
	},
	Radius = {
		Maximum = 100.0,
		Minimum = 30.0,
		TimeRemove = 60 * 1000
	},
	Time = {
		Starting = 3 * 1000, 
	    Started  = 30 * 1000,
	},
	Marker = {    
		Enable = true,
		Colour = {
			Starting = { r = 81, g = 214, b = 214, a = 100 }, 
			Started = { r = 138, g = 1, b = 1, a = 100 },
		}
	},
	Rewards = { 
		Winner = {
			{ account = 'money', amount = { 300, 1000 }, percent = 10  },
			{ account = 'black_money', amount = { 150, 500 }, percent = 100  },
			{ name = 'armour', amount = { 1, 5 }, percent = 100 },
			{ name = 'fixkit', amount = { 1, 1 }, percent = 100 },
		},
		Joined = {
			{ account = 'money', amount = { 300, 1000 }, percent = 100 },
			{ name = 'painkiller', amount = { 1, 5 }, percent = 100 },
		},
	},
	Shared = {
		Unique = "item",
		Name = {
			"matrix_saki_0s",
			"matrix_saki_1s",
			"matrix_saki_2s",
			"matrix_saki_3s",
		}
	},
	Permission = {
		Whitelist = {
			---@field Unique string ตัวเลือกประเภทการตรวจสอบสิทธิ์
			---@props "item" ตรวจสอบด้วยไอเท็ม | job ตรวจสอบด้วยอาชีพ | xcore-gang ตรวจสอบด้วยแก๊ง
			---@field Name string[] ชื่อไอเท็ม หรือ ชื่ออาชีพ หรือ ชื่อแก๊ง
			---@props หากใช้ item ให้ใส่ชื่อไอเท็มที่ต้องการตรวจสอบ เช่น "water", "bread"
			---@props หากใช้ job ให้ใส่ชื่ออาชีพที่ต้องการตรวจสอบ เช่น "police", "ambulance"
			---@props หากใช้ xcore-gang ให้ใส่ชื่อแก๊งที่ต้องการตรวจสอบ เช่น "gang.1", "gang.2" (รูปแบบ format types.rank เช่น gang.1)
			---@description Unique "xcore-gang" รองรับเซิฟเวอร์ที่ใช้ระบบ xcore-gang เท่านั้น

			Unique = "xcore-gang",
			Name = {
				"gang.1",  
				"gang.2",
				-- "matrix_saki_2s",
				-- "matrix_saki_3s",
			},
		},
		Blacklist = {
			Unique = "",
			Name = {}
		},
	},
	Instance = 63, --// 0-63,
	Blips = {
		Enable = true,
		Default = {
			Label = 'แกงค์ T.1',
			Sprite = 94,
			Colour = 32,
			Scale = 0.8,
		},
		Circle = {
		    Colour = 9,
			Alpha = 180,
		}
	},
}