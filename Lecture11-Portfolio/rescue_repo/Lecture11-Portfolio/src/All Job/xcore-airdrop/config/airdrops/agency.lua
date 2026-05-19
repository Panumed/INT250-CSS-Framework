config.airdrops[#config.airdrops + 1] = {
	Name = "หน่วยงาน",
	Teleport = true,
	Sound = "explosion",
	Image = {
    	Starting = 'started', 
	    Started = 'starting',
    },
	Position = {                          
		vector3(1751.11, 3256.26, 41.45)
	},
	MaxPlayers = 100,
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
	    Started  = 90 * 1000,
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
		Unique = "job",
		Name = {
			"police",
			-- "phone",
		}
	},
	Permission = {
		Whitelist = {
			Unique = "job",
			Name = {
				"ambulance",
				"offambulance",
				"police",
				"offpolice",
			}
		},
		Blacklist = {
			Unique = "",
			Name = {}
		},
	},
	Instance = 61, --// 0-63,
	Blips = {
		Enable = true,
		Default = {
			Label = 'หน่วยงาน',
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