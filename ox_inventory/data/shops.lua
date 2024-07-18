
local function getRandomItems(items, count)
    local randomItems = {}
    local itemIndices = {}
    for i = 1, #items do
        table.insert(itemIndices, i)
    end

    for i = 1, count do
        if #itemIndices == 0 then break end
        local randomIndex = math.random(1, #itemIndices)
        table.insert(randomItems, items[itemIndices[randomIndex]])
        table.remove(itemIndices, randomIndex)
    end

    return randomItems
end
return {
	General = {
		name = 'Квартален магазин',
		blip = {
			id = 59, colour = 34, scale = 0.8
		}, inventory = getRandomItems({
			{ name = 'burger', price = 10 },
			{ name = 'water', price = 10 },
			{ name = 'sprunk', price = 20 },
			{ name = 'energydrink', price = 20 },
			{ name = 'dry_rice', price = 50 }
		}, 5), locations = {
			vec3(25.7, -1347.3, 29.49), -- next to vanila
			vec3(-3038.71, 585.9, 7.9), -- left highway
			vec3(1728.66, 6414.16, 35.03), -- pale
			vec3(1697.99, 4924.4, 42.06), -- grapeseed
			vec3(547.79, 2671.79, 42.15), -- not setup
			vec3(2557.94, 382.05, 108.62), -- right right highway
			vec3(373.55, 325.56, 103.56), -- paccific
		}, targets = {
			-- { loc = vec3(25.06, -1347.32, 29.5), length = 0.7, width = 0.5, heading = 0.0, minZ = 29.5, maxZ = 29.9, distance = 1.5 }, -- next to vanilla
			-- { loc = vec3(-3039.18, 585.13, 7.91), length = 0.6, width = 0.5, heading = 15.0, minZ = 7.91, maxZ = 8.31, distance = 1.5 },
			-- { loc = vec3(1728.39, 6414.95, 35.04), length = 0.6, width = 0.6, heading = 65.0, minZ = 35.04, maxZ = 35.44, distance = 1.5 },
			-- { loc = vec3(1698.37, 4923.43, 42.06), length = 0.5, width = 0.5, heading = 235.0, minZ = 42.06, maxZ = 42.46, distance = 1.5 },
			-- { loc = vec3(2557.19, 381.4, 108.62), length = 0.6, width = 0.5, heading = 0.0, minZ = 108.62, maxZ = 109.02, distance = 1.5 },
			-- { loc = vec3(373.13, 326.29, 103.57), length = 0.6, width = 0.5, heading = 345.0, minZ = 103.57, maxZ = 103.97, distance = 1.5 },
			{
                ped = `mp_m_shopkeep_01`,
                scenario = 'WORLD_HUMAN_AA_COFFEE',
                loc = vec3(24.43, -1346.40, 28.50),
                heading =  267.54,
            },
			{
                ped = `mp_m_shopkeep_01`,
                scenario = 'WORLD_HUMAN_AA_COFFEE',
                loc = vec3(-3039.95, 584.23, 6.91),
                heading = 19.19,
            },
			{
                ped = `mp_m_shopkeep_01`,
                scenario = 'WORLD_HUMAN_AA_COFFEE',
                loc = vec3(1728.19, 6415.97, 34.04),
                heading = 244.49,
            },
			{
                ped = `mp_m_shopkeep_01`,
                scenario = 'WORLD_HUMAN_AA_COFFEE',
                loc = vec3(1697.31, 4923.34, 41.06),
                heading = 328.39,
            },
			{
                ped = `mp_m_shopkeep_01`,
                scenario = 'WORLD_HUMAN_AA_COFFEE',
                loc = vec3(2555.65, 380.90, 107.62),
                heading = 354.70,
            },
			{
                ped = `mp_m_shopkeep_01`,
                scenario = 'WORLD_HUMAN_AA_COFFEE',
                loc = vec3(372.91, 328.02, 102.57),
                heading = 257.93,
            },
			{
                ped = `mp_m_shopkeep_01`,
                scenario = 'WORLD_HUMAN_AA_COFFEE',
                loc = vec3(-706.08, -914.57, 18.22),
                heading = 86.86,
            },
		}
	},

	Liquor = {
		name = '24/7 Алкохол и цигари',
		blip = {
			id = 93, colour = 34, scale = 0.8
		}, inventory = getRandomItems({
			{ name = 'vodka', price = 30 },
			{ name = 'whiskey', price = 45 },
			{ name = 'burban', price = 40 },
			{ name = 'energydrink', price = 25 },
			{ name = 'rolling_paper', price = 8 },
		}, 5), locations = {
			vec3(1135.808, -982.281, 46.415), -- under mirror
			vec3(-2968.243, 390.910, 15.043), -- left highway
			vec3(1166.024, 2708.930, 38.157), -- sandi
			vec3(-1393.409, -606.624, 30.319) -- bahama
		}, targets = {
			-- { loc = vec3(1134.9, -982.34, 46.41), length = 0.5, width = 0.5, heading = 96.0, minZ = 46.4, maxZ = 46.8, distance = 1.5 },
			-- { loc = vec3(-2967.0, 390.9, 15.14), length = 0.7, width = 0.5, heading = 85.23, minZ = 15.0, maxZ = 15.4, distance = 1.5 },
			-- { loc = vec3(1165.95, 2710.20, 38.26), length = 0.6, width = 0.5, heading = 178.84, minZ = 38.1, maxZ = 38.5, distance = 1.5 },
			-- { loc = vec3(1393.0, 3605.95, 35.11), length = 0.6, width = 0.6, heading = 200.0, minZ = 35.0, maxZ = 35.4, distance = 1.5 }
			{
                ped = `mp_m_shopkeep_01`,
                scenario = 'WORLD_HUMAN_AA_COFFEE',
                loc = vec3(1134.24, -983.11, 45.42),
                heading = 273.12,
            },
			{
                ped = `mp_m_shopkeep_01`,
                scenario = 'WORLD_HUMAN_AA_COFFEE',
                loc = vec3(-2966.32, 391.46, 14.04),
                heading = 88.35,
            },
			{
                ped = `mp_m_shopkeep_01`,
                scenario = 'WORLD_HUMAN_AA_COFFEE',
                loc = vec3(1165.34, 2710.87, 37.16),
                heading = 182.26,
            },
			{
                ped = `mp_m_shopkeep_01`,
                scenario = 'WORLD_HUMAN_AA_COFFEE',
                loc = vec3(1391.25, 3605.91, 33.98),
                heading = 196.84,
            },
		}
	},

	YouTool = {
		name = 'Digital Den',
		blip = {
			id = 817, colour = 27, scale = 0.8
		},
		inventory = getRandomItems({
			{ name = 'phone', price = 800 },
			{ name = 'app_tablet', price = 10000 },
			{ name = 'radio', price = 500 },
			{ name = 'powerbank', price = 120 },
			{ name = 'radio_battery', price = 120 },
		}, 5),
		locations = {
			vec3(-658.12, -858.15, 23.64)
		},
		targets = {
			-- { loc = vec3(-658.12, -858.15, 23.64), length = 0.6, width = 3.0, heading = 65.0, minZ = 55.0, maxZ = 56.8, distance = 3.0 }
			{
                ped = `a_m_m_afriamer_01`,
                scenario = 'WORLD_HUMAN_AA_COFFEE',
                loc = vec3(-658.68, -854.72, 23.51),
                heading = 6.16,
            },
		}
	},

	YouToolTwo = {
		name = 'Железария',
		blip = {
			id = 402, colour = 1, scale = 0.8
		},
		inventory = getRandomItems({
			{ name = 'lockpick', price = 100 },
			{ name = 'WEAPON_WRENCH', price = 3000 },
			{ name = 'WEAPON_FLASHLIGHT', price = 5000 },
			{ name = 'WEAPON_HAMMER', price = 5000 },
			{ name = 'clothing_bag', price = 3000 },
			{ name = 'ziptie', price = 300 },
			{ name = 'flush_cutter', price = 3000 },
			{ name = 'bolt_cutter', price = 3000 },
			{ name = 'solderingiron', price = 1500 }
		}, 9),
		locations = {
			vec3(746.70, -1399.40, 26.62)
		},
		targets = {
			-- { loc = vec3(746.70, -1399.40, 26.62), length = 0.6, width = 3.0, heading = 65.0, minZ = 55.0, maxZ = 56.8, distance = 3.0 }
			{
                ped = `mp_m_shopkeep_01`,
                scenario = 'WORLD_HUMAN_AA_COFFEE',
                loc = vec3(746.83, -1399.30, 25.63),
                heading = 178.09,
            },
		}
	},
	YouToolThree = {
		name = 'Стария Миньор',
		-- blip = {
		-- 	id = 442, colour = 2, scale = 0.8
		-- },
		inventory = getRandomItems({
			{ name = 'goldpan', price = 4500 },
			{ name = 'pickaxe', price = 125 },
			{ name = 'miningdrill', price = 11500 },
			{ name = 'mininglaser', price = 20000 },
			{ name = 'drillbit', price = 10 },
			{ name = 'weapon_flashlight', price = 5000 }
		}, 6),
		locations = {
			vec3(-1121.64, 4980.47, 185.23)
		},
		targets = {
			-- { loc = vec3(-1121.64, 4980.47, 185.23), length = 0.6, width = 3.0, heading = 65.0, minZ = 55.0, maxZ = 56.8, distance = 3.0 }
			{
                ped = `G_M_M_ChemWork_01`,
                scenario = 'WORLD_HUMAN_CLIPBOARD',
                loc = vec3(2960.9, 2754.14, 42.71),
                heading = 203.58
            },
		}
	},

	Ammunation = {
		name = 'Оръжеен магазин',
		blip = {
			id = 110, colour = 34, scale = 0.8
		}, inventory = getRandomItems({
			{ name = 'ammo-9', price = 50 },
			{ name = 'WEAPON_KNIFE', price = 4500 },
			{ name = 'WEAPON_BAT', price = 6000 },
			{ name = 'WEAPON_KATANA_2', price = 18000 },
			{ name = 'WEAPON_DRAGON_KATANA_RED', price = 20000 },
			{ name = 'WEAPON_DRAGON_KATANA_BLUE', price = 20000 },
			{ name = 'WEAPON_DRAGON_KATANA_GREEN', price = 20000 },
			{ name = 'WEAPON_DRAGON_KATANA_PURPLE', price = 20000 },
			{ name = 'WEAPON_DRAGON_KATANA_YELLOW', price = 20000 },
			{ name = 'WEAPON_KATANA_2_TRIAD', price = 20000 },
			{ name = 'WEAPON_COMBATPISTOL', price = 60000, metadata = { registered = true }, license = 'weapon' }
		}, 11), locations = {
			vec3(-662.180, -934.961, 21.829), -- little
			vec3(1693.44, 3760.16, 34.71), -- sandi
			vec3(-330.24, 6083.88, 31.45), -- pale
			vec3(2567.69, 294.38, 108.73) -- right right highway
		}, targets = {
			-- { loc = vec3(-660.92, -934.10, 21.94), length = 0.6, width = 0.5, heading = 180.0, minZ = 21.8, maxZ = 22.2, distance = 2.0 },
			-- { loc = vec3(1693.57, 3761.60, 34.82), length = 0.6, width = 0.5, heading = 227.39, minZ = 34.7, maxZ = 35.1, distance = 2.0 },
			-- { loc = vec3(-330.29, 6085.54, 31.57), length = 0.6, width = 0.5, heading = 225.0, minZ = 31.4, maxZ = 31.8, distance = 2.0 },
			-- { loc = vec3(2566.59, 293.13, 108.85), length = 0.6, width = 0.5, heading = 360.0, minZ = 108.7, maxZ = 109.1, distance = 2.0 },
			{
                ped = `mp_m_shopkeep_01`,
                scenario = 'WORLD_HUMAN_AA_COFFEE',
                loc = vec3(-662.63, -933.52, 20.83),
                heading = 184.04,
            },
			{
                ped = `mp_m_shopkeep_01`,
                scenario = 'WORLD_HUMAN_AA_COFFEE',
                loc = vec3(1692.08, 3760.77, 33.71),
                heading = 223.11,
            },
			{
                ped = `mp_m_shopkeep_01`,
                scenario = 'WORLD_HUMAN_AA_COFFEE',
                loc = vec3(-331.93, 6084.73, 30.45),
                heading = 221.90,
            },
			{
                ped = `mp_m_shopkeep_01`,
                scenario = 'WORLD_HUMAN_AA_COFFEE',
                loc = vec3(2568.30, 292.55, 107.73),
                heading = 359.60,
            },
		}
	},

	PoliceArmoury = {
		name = 'Полицейска оръжейна',
		groups = shared.police,
		blip = {
			id = 110, colour = 34, scale = 0.8
		}, inventory = {
			{ name = 'radio', price = 0 },
			{ name = 'radio_battery', price = 0},
			{ name = 'armour2', price = 0},
			{ name = 'ammo-9', price = 0, grade = 1 },
			{ name = 'handcuffs', price = 0, grade = 8 },
			{ name = 'ammo-rifle', price = 0, grade = 8 },
			{ name = 'WEAPON_FLASHLIGHT', price = 0, grade = 8 },
			{ name = 'WEAPON_NIGHTSTICK', price = 0, grade = 8 },
			{ name = 'WEAPON_STUNGUN', price = 0, metadata = { registered = true, serial = 'POLICE'}, grade = 8 },
			{ name = 'WEAPON_PISTOL_MK2', price = 0, metadata = { registered = true, serial = 'POLICE' }, grade = 8 },
			{ name = 'police_stormram', price = 0, grade = 8 },
			{ name = 'leo_gps', price = 0, grade = 8 },
			{ name = 'alcoholtester', price = 0, grade = 8 }
		}, locations = {
			vec3(600.39, 22.11, 82.24)
		}, targets = {
			{ loc = vec3(482.48, -994.67, 30.29), length = 0.5, width = 3.0, heading = 270.0, minZ = 29.5, maxZ = 32.0, distance = 6 }
		}
	},

	Disco = {
		name = 'Mini Bar',
		groups = {
			['galaxybar'] = 0
		},
		blip = {
			id = 76, colour = 3, scale = 0.8
		}, inventory = {
			{ name = 'whiskey', price = 5 },
			{ name = 'vodka', price = 5 },
			{ name = 'energydrink', price = 5 },
			{ name = 'burban', price = 5 }
		}, locations = {
			vec3(-159.28, -1071.89, 29.01)
		}, targets = {
			{ loc = vec3(-159.28, -1071.89, 29.01), length = 0.5, width = 3.0, heading = 270.0, minZ = 29.5, maxZ = 32.0, distance = 6 }
		}
	},
	

	Medicine = {
		name = 'Medicine Cabinet',
		groups = {
			['ambulance'] = 0
		},
		blip = {
			id = 403, colour = 69, scale = 0.8
		}, inventory = {
			{ name = 'firstaid', price = 0 },
			{ name = 'bandage', price = 0 },
			{ name = 'painkillers', price = 0 }
		}, locations = {
			vec3(306.3687, -601.5139, 43.28406)
		}, targets = {
			{ loc = vec3(-659.90, 332.75, 81.68), length = 0.5, width = 3.0, heading = 270.0, minZ = 29.5, maxZ = 32.0, distance = 6 }
		}
	},

	BlackMarketArms = {
		name = 'Черен пазар',
		inventory = getRandomItems({
			{ name = 'grinder', price = 3500, currency = 'money' },
			{ name = 'armour', price = 1000, currency = 'money' },
			{ name = 'ammo-9', price = 10, currency = 'money' },
			{ name = 'ammo-45', price = 20, currency = 'money' },
		    { name = 'ammo-50', price = 25, currency = 'money' },
			{ name = 'WEAPON_CERAMICPISTOL', price = 35000, metadata = { registered = true }, currency = 'money' },
			{ name = 'WEAPON_COMBATPISTOL', price = 45000, metadata = { registered = true }, currency = 'money' },
			{ name = 'WEAPON_PISTOLXM3', price = 50000, metadata = { registered = true }, currency = 'money' },
			{ name = 'WEAPON_HEAVYPISTOL', price = 50000, metadata = { registered = true }, currency = 'money' },
			{ name = 'WEAPON_PISTOL50', price = 70000, metadata = { registered = true }, currency = 'money' }
		}, 3), locations = {
			vec3(822.99, -2338.67, 30.33)
		}, targets = {
			-- { loc = vec3(822.99, -2338.67, 30.33), length = 4.5, width = 5.0, heading = 270.0, minZ = 56.5, maxZ = 57.0, distance = 16 } 586.46, -2085.15, 5.94, 218.25
			{
                ped = `g_m_m_chicold_01`,
                scenario = 'WORLD_HUMAN_AA_COFFEE',
                loc = vec3(586.46, -2085.15, 5.94),
                heading = 218.25,
            },
		}
	},
	HeckersHut = {
		name = 'Къщурката на Хекера',
		inventory = getRandomItems({
			{ name = 'debitcard', price = 1500, currency = 'money' },
			{ name = 'plasma', price = 4500, currency = 'money' },
		    -- { name = 'ammo-50', price = 50, currency = 'money' },
			-- { name = 'WEAPON_CERAMICPISTOL', price = 45000, metadata = { registered = true }, currency = 'money' },
			-- { name = 'WEAPON_COMBATPISTOL', price = 55000, metadata = { registered = true }, currency = 'money' },
			-- { name = 'WEAPON_PISTOLXM3', price = 60000, metadata = { registered = true }, currency = 'money' },
			-- { name = 'WEAPON_PISTOL50', price = 80000, metadata = { registered = true }, currency = 'money' }
		}, 2), locations = {
			vec3(-77.50, 364.65, 112.44)
		}, targets = {
			-- { loc = vec3(-77.50, 364.65, 112.44), length = 4.5, width = 5.0, heading = 270.0, minZ = 56.5, maxZ = 57.0, distance = 16 }
			{
                ped = `g_m_importexport_01`,
                scenario = 'WORLD_HUMAN_AA_COFFEE',
                loc = vec3(-1111.92, 312.66, 67.15),
                heading = 338.59,
            },
		}
	},

	VendingMachineDrinks = {
		name = 'Вендинг машина',
		inventory = getRandomItems({
			{ name = 'water', price = 20 },
			{ name = 'sprunk', price = 20 },
			{ name = 'energydrink', price = 30 },
			-- { name = 'soda', price = 20 }
		}, 3),
		model = {
			`prop_vend_soda_02`, `prop_vend_fridge01`, `prop_vend_water_01`, `prop_vend_soda_01`
		}
	},
	Prison = {
		name = 'Jail Cafeteria',
		groups = {
			['unemployed'] = 0
		},
		blip = {
			id = 237, colour = 72, scale = 0.6
		}, inventory = {
			{ name = 'burger', price = 1 },
			{ name = 'water', price = 1 },
		}, locations = {
			vec3(1777.93, 2560.1, 45.0)
		}, targets = {
			{ loc = vec3(1777.93, 2560.1, 45.0), length = 0.5, width = 3.0, heading = 270.0, minZ = 29.5, maxZ = 32.0, distance = 6 }
		}
	},
}
