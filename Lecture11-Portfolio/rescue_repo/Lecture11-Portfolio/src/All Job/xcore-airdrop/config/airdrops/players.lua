config.airdrops[#config.airdrops + 1] = {
	Name = "ประชาชน",
	Teleport = true,
	Sound = "explosion",
	Image = {
    	Starting = 'airdrop', 
	    Started = 'airdrop',
    },
	Position = {                          
		vector3(2583.94, 5197.47, 44.75)
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
		Starting = 10 * 1000, 
	    Started  = 300 * 1000,
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
			{ name = 'armour', amount = { 1, 5 }, percent = 100 },
			{ name = 'fixkit', amount = { 1, 1 }, percent = 100 },
		},
		Joined = {
			{ account = 'money', amount = { 300, 1000 }, percent = 100 },
			{ name = 'fixkit', amount = { 1, 1 }, percent = 100 },
		},
	},
	Shared = {
		Unique = "item",
		Name = {
			"water",
			"phone",
		}
	},
	Instance = 62, --// 0-63
	Blips = {
		Enable = true,
		Default = {
			Label = 'ประชาชน',
			Sprite = 94,
			Colour = 32,
			Scale = 0.8,
		},
		Circle = {
		    Colour = 9,
			Alpha = 180,
		}
	},
	Permission = {
		Whitelist = {
			Unique = "job",
			Name = {
				"unemployed",
				"police"
			}
		},
		Blacklist = {
			Unique = "item",
			Name = {
				-- "phone",
				"item_gang_1",
				"item_gang_2",
				"item_gang_3",
			}
		},
	},
}