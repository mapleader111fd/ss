print("^2Jim^7-^2DJBooth ^7v^41^7.^43^7.^42 ^2by ^1Jimathy^7")

Config = {
	Lan = "en",
	Debug = false, -- Set to true to show target locations

	Core = "qb-core",
	Menu = "qb",
	Notify = "qb",

	Locations = {
		-- { -- Vanilla Unicorn DJ Booth
		-- 	job = "vanilla", -- Set this to required job role
		-- 	enableBooth = false, -- option to disable rather than deleting code
		-- 	DefaultVolume = 0.1, -- 0.01 is lowest, 1.0 is max
		-- 	radius = 30, -- The radius of the sound from the booth
		-- 	coords = vec3(120.0, -1281.72, 29.48), -- Where the booth is located
		-- },
		-- { -- Sisyphus Theater
		-- 	job = "public", -- "public" makes it so anyone can add music.
		-- 	enableBooth = true,
		-- 	DefaultVolume = 0.15,
		-- 	radius = 200,
		-- 	coords = vec3(206.9, 1181.04, 226.51),
		-- 	soundLoc = vec3(212.32, 1155.87, 227.01), -- Add sound origin location if you don't want the music to play from the dj booth
		-- },
		-- { -- Henhouse (smokeys MLO coords)
		-- 	job = "henhouse",
		-- 	enableBooth = true,
		-- 	DefaultVolume = 0.1,
		-- 	radius = 30,
		-- 	coords = vec3(-311.35, 6265.18, 32.06),
		-- },
		-- { -- Tequilala bar (ingame mlo)
		-- 	job = "tequilala",
		-- 	enableBooth = false,
		-- 	DefaultVolume = 0.1,
		-- 	radius = 30,
		-- 	coords = vec3(-549.68, 282.64, 82.98),
		-- },
		-- { -- GabzTuners Radio Prop
		-- 	job = "mechanic",
		-- 	enableBooth = true,
		-- 	DefaultVolume = 0.1,
		-- 	radius = 30,
		-- 	coords = vec3(127.04, -3030.65, 6.80),
		-- 	prop = `prop_radio_01`	-- Prop to spawn at location, if the location doesn't have one already
		-- 							-- (can be changed to any prop, coords determine wether its placed correctly)
		-- },
		-- { -- Gabz Popsdiner Radio Prop
		-- 	job = "public",
		-- 	enableBooth = true,
		-- 	DefaultVolume = 0.1,
		-- 	radius = 30,
		-- 	coords = vec3(1595.53, 6453.02, 26.165),
		-- 	prop = `prop_boombox_01`
		-- },
		-- { -- LostMC compound next to Casino
		-- 	gang = "lostmc",
		-- 	enableBooth = true,
		-- 	DefaultVolume = 0.1,
		-- 	radius = 20,
		-- 	coords = vec3(983.14, -133.17, 79.59),
		-- 	soundLoc = vec3(988.79, -131.62, 78.89), -- Add sound origin location if you don't want the music to play from the dj booth
		-- },
		{  --RoofTop Caffe
		 	job = "beanmachine", -- Set this to required job role
		 	enableBooth = true, -- option to disable rather than deleting code
		 	DefaultVolume = 0.1, -- 0.01 is lowest, 1.0 is max
		 	radius = 70, -- The radius of the sound from the booth
		 	coords = vec3(322.93, -891.11, 60.20), -- Where the booth is located
		 },
		 {  --Galaxy Bar
		 job = "galaxybar", -- Set this to required job role
		 enableBooth = true, -- option to disable rather than deleting code
		 DefaultVolume = 0.1, -- 0.01 is lowest, 1.0 is max
		 radius = 35, -- The radius of the sound from the booth
		 coords = vec3(-156.94, -1074.27, 28.92), -- Where the booth is located
	 },
	},
}

Loc = {}