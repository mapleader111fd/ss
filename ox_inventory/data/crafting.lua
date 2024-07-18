return {
	{
		items = {
			{
				name = 'hackingchip',
				ingredients = {
					iron = 15,
					copper = 20,
					metalscrap = 35,
					flush_cutter = 0.10
				},
				duration = 5000,
				count = 1,
			},
			{
				name = 'hackingdevice2',
				ingredients = {
					hackingchip = 3,
					iron = 12,
					copper = 30,
					plastic = 25,
					metalscrap = 35,
					WEAPON_HAMMER = 0.10,
					solderingiron = 0.30
				},
				duration = 5000,
				count = 1,
			},
			{
				name = 'hackinglaptop',
				ingredients = {
					debitcard = 1,
					hackingchip = 6,
					hackingdevice2 = 2,
					usb = 3,
					iron = 20,
					copper = 30,
					metalscrap = 60,
					WEAPON_HAMMER = 0.30,
					solderingiron = 0.40
				},
				duration = 5000,
				count = 1,
			},
			{
				name = 'drill',
				ingredients = {
					iron = 30,
					copper = 20,
					plastic = 15,
					metalscrap = 19,
					WEAPON_HAMMER = 0.35
				},
				duration = 5000,
				count = 1,
			},
			{
				name = 'drilllvl2',
				ingredients = {
					drill = 3,
					plasma = 1,
					iron = 20,
					copper = 30,
					plastic = 40,
					metalscrap = 10,
					WEAPON_HAMMER = 0.30,
					solderingiron = 0.35
				},
				duration = 5000,
				count = 1,
			},
			{
				name = 'usb_boosting',
				ingredients = {
					debitcard = 1,
					iron = 140,
					copper = 180,
					plastic = 160,
					metalscrap = 200,
					solderingiron = 0.35
				},
				duration = 5000,
				count = 1,
			},
			-- {
			-- 	name = 'usb_racing',
			-- 	ingredients = {
			-- 		debitcard = 2,
			-- 		iron = 140,
			-- 		copper = 180,
			-- 		plastic = 60,
			-- 		metalscrap = 220,
			-- 		solderingiron = 0.35
			-- 	},
			-- 	duration = 5000,
			-- 	count = 1,
			-- },
			
		},
		points = {
			vec3(565.76, -3120.44, 17.32),
		},
		zones = {
			{
				coords = vec3(565.76, -3120.44, 17.32),
				size = vec3(3.8, 1.05, 0.15),
				distance = 1.5,
				rotation = 315.0,
			},
			
		},
	},
	{
		items = {
			{
				name = 'radio',
				ingredients = {
					dry_rice = 1,
					radio_broken = 1
				},
				duration = 5000,
				count = 1,
			},
		},
		points = {
			vec3(-654.58, -859.74, 24.51),
		},
		zones = {
			{
				coords = vec3(-654.58, -859.74, 24.51),
				size = vec3(3.8, 1.05, 0.15),
				distance = 1.5,
				rotation = 315.0,
			},
			
		},
	},
	{
		items = {
			{
				name = 'smallbomb',
				ingredients = {
					gunpowder = 40,
					metalscrap = 90,
					plastic = 40,
					flush_cutter = 0.25,
					solderingiron = 0.10
				},
				duration = 5000,
				count = 1,
			},
		},
		points = {
			vec3(573.29, -3124.17, 17.51),
		},
		zones = {
			{
				coords = vec3(573.29, -3124.17, 17.51),
				size = vec3(3.8, 1.05, 0.15),
				distance = 1.5,
				rotation = 315.0,
			},
			
		},
	},
}
