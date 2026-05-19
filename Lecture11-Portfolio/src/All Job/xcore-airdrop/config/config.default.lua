config.airdrops = {};

config.defaults = {
    -- Name = "players", -- // ชื่อ Airdrop
	Teleport = true,     -- // สามารถ Teleport ไปได้
	Sound = "explosion", -- // เสียงเมื่อ เริ่ม Airdrop
	Image = {
    	Starting = 'Starting', -- // รูปภาพ ตามที่ใส่ไว้ใน xcore-airdrop\html\img
	    Started = 'Started',   -- // รูปภาพ ตามที่ใส่ไว้ใน xcore-airdrop\html\img
    },
	Position = { -- // จุด Airdrop
		-- vector3(1751.11, 3256.26, 41.45)
		-- vector3(0.11, 0.26, 0.45)
		-- vector3(2.11, 2.26, 2.45)
	},
	-- AutoTime = { '01:13', '19:30', '23:00' }, -- // เวลา Auto
	MaxPlayers = 100,
	-- ExpandMaxPlayers = { 
	-- 	Unique = "job",  -- // ชนิดของการกำหนดขีดจำกัดผู้เล่น ผู้เล่นที่เข้า Airdrop ได้ตามจำนวน | กำหนดได้ทั้ง item และ job (ไม่ใช้ให้ใส่ "" หรือลบทั้ง Table ออกไป)
	-- 	Name = {         -- // ใส่ชื่อ item หรือ ชื่อ job แล้วกำหนดตัวเลข (EX. อาชีพ police เข้าได้ 1 คน)
	-- 		["police"] = 1,
	-- 		["..."] = 1,
	-- 		["..."] = 1,
	-- 	}
	-- },
	Raduis = {            -- // ขนาดวง Airdrop
		Maximum = 100.0,  -- // วงใหญ่สุด
		Minimum = 30.0,   -- // วงบีบเล็กสุดได้เท่าไหร่
		TimeRemove = 60 * 1000 -- // ระยะเวลาวงบีบ ใหญ่สุดไปเล็กสุด (หากไม่ต้องการให้วงบีบ ปรับ Minimum ให้เท่ากับ Maximum)
	},
	Passive = true, -- // Passive Mode (ต่อยกันไม่ได้ จนกว่า Airdrop จะปลดล็อค)
	-- Time = {
	-- 	Starting = 60 * 1000,     -- // รอกี่นาที Airdrop ถึงจะ ปลดล็อค
	--     Started  = 60 * 1000,  -- // เมื่อ Airdrop ปลดล็อคแล้ว รอกี่นาที Airdrop ถึงจะ ลบ
	-- },
	Marker = {    
		Enable = true, -- // เปิดวง Marker ให้ผู้เล่นเห็นหรือไม่
		Colour = {
			Starting = { r = 81, g = 214, b = 214, a = 100 },  -- // สีของวงเมื่อ Airdrop กำลัง ล็อค อยู่
			Started = { r = 138, g = 1, b = 1, a = 100 },      -- // สีของวงเมื่อ Airdrop ปลดล็อค แล้ว
		}
	},
	-- Rewards = { 
	-- 	Winner = { -- // ของ รางวัล คนชนะ
	-- 		{ account = 'money', amount = { 300, 1000 }, percent = 10  },
	-- 		{ account = 'black_money', amount = { 150, 500 }, percent = 70  },
	-- 		{ name = 'water', amount = { 1, 5 }, percent = 70 },
	-- 	},
	-- 	Joined = {  -- // ของ รางวัล ปลอบใจ (เข้าร่วม airdrop ได้ทุกคน)
	-- 		{ account = 'money', amount = { 300, 1000 }, percent = 100 },
	-- 		{ name = 'water', amount = { 1, 5 }, percent = 100 },
	-- 	},
	-- },
	Object = {
		Name = 'prop_box_wood02a_pu', -- // ชื่อ Object ของ Airdrop https://forge.plebmasters.de/objects
		Flare = {
			Enable = true,  -- // เปิดใช้งานควันสีแดงไหม หากไม่เปิดให้ปรับเป็น false 
			Loop   = true,  -- // ควันสีแดงอยู่ตลอดขณะที่ Airdrop ยังไม่หายไป (หากให้ควันขึ้นแค่ตอนกล่องลงแล้วหายไป ให้ลบค่านี้ทิ้ง หรือ ปรับเป็น false)
		},
		Closest = 2.0,      -- // ระยะเข้าใกล้ ถึงเก็บได้
	},
	-- Shared = {
	-- 	Unique = "item", -- // option ให้ของใน Airdrop กับผู้เล่นที่มีไอเท็มเดียวกัน หรือ อาชีพเดียวกันได้ (เฉพาะผู้เล่นที่อยู่ในวง) | กำหนดได้ทั้ง item และ job
	-- 	Name = {         -- // ใส่ชื่อ item หรือ ชื่อ job ที่ต้องการให้แชร์ของรางวัลเข้าไป
	-- 		"water",
	-- 		"phone",
	-- 	}
	-- },
	-- Permission = {
	-- 	Whitelist = {    
	-- 		---@field Unique string ตัวเลือกประเภทการตรวจสอบสิทธิ์
	-- 		---@props "item" ตรวจสอบด้วยไอเท็ม | job ตรวจสอบด้วยอาชีพ | xcore-gang ตรวจสอบด้วยแก๊ง
	-- 		---@field Name string[] ชื่อไอเท็ม หรือ ชื่ออาชีพ หรือ ชื่อแก๊ง
	-- 		---@props หากใช้ item ให้ใส่ชื่อไอเท็มที่ต้องการตรวจสอบ เช่น "water", "bread"
	-- 		---@props หากใช้ job ให้ใส่ชื่ออาชีพที่ต้องการตรวจสอบ เช่น "police", "ambulance"
	-- 		---@props หากใช้ xcore-gang ให้ใส่ชื่อแก๊งที่ต้องการตรวจสอบ เช่น "gang.1", "gang.2" (รูปแบบ format types.rank เช่น gang.1)
	-- 		---@description Unique "xcore-gang" รองรับเซิฟเวอร์ที่ใช้ระบบ xcore-gang เท่านั้น
	-- 		Unique = "job", -- // Whitelist ผู้เล่นที่เข้า Airdrop ได้ | กำหนดได้ทั้ง item และ job (ไม่ใช้ให้ใส่ "" หรือลบทั้ง Table ออกไป)
	-- 		Name = {        -- // ใส่ชื่อ item หรือ ชื่อ job ที่ต้องการให้เข้า airdrop ได้ลงไป
	-- 			"ambulance",
	-- 			"offambulance",
	-- 			"police",
	-- 			"offpolice",
	-- 		}
	-- 	},
	-- 	Blacklist = {
	-- 		Unique = "item",   -- // Blacklist ผู้เล่นที่เข้า Airdrop ได้ | กำหนดได้ทั้ง item และ job (ไม่ใช้ให้ใส่ "" หรือลบทั้ง Table ออกไป)
	-- 		Name = {           -- // ใส่ชื่อ item หรือ ชื่อ job ไม่ต้องการให้เข้า Airdrop ลงไป
	-- 			"water"
	-- 		}
	-- 	},
	-- },
	-- Instance = 61, -- // Instance หรือ Dimension (แยกโลก) ไม่ใช้ให้ลบออก หรือใส่ 0 (โลกปกติ) | ใช้ได้ตั้งแต่ 0 - 63
	-- Blips = {
	-- 	Enable = true,          -- // เปิดใช้งาน Blip
	-- 	Default = {             -- // ตั้งค่า Blip ของ Airdrop https://docs.fivem.net/docs/game-references/blips/
	-- 		Label = 'หน่วยงาน',
	-- 		Sprite = 94,
	-- 		Colour = 32,
	-- 		Scale = 0.8,
	-- 	},
	-- 	Circle = {              -- // วงรอบ Blip (ไม่ใช้ให้ลบทั้ง Table นี้)
	-- 	    Colour = 9,
	-- 		Alpha = 180,
	-- 	}
	-- },
}
