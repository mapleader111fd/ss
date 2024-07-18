local QBCore = exports['qb-core']:GetCoreObject()
return {
	-- Foods
	['burger'] = {
		label = 'Бургер',
		weight = 220,
		degrade = 2880,
		decay = true,
		client = {
			status = { hunger = 150000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = 'Изяде уникален бургер!'
		},
	},
	['shiny_wasabi'] = {
		label = 'Блестящо уасаби',
		weight = 220,
		degrade = 1440,
		decay = true,
		client = {
			status = { hunger = 200000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = 'Изяде Блестящо уасаби'
		},
	},
 
	-- Drinks
	['water'] = {
		label = 'Вода',
		weight = 500,
		degrade = 2880,
		decay = true,
		client = {
			status = { thirst = 150000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_flow_bottle`, pos = vec3(0.03, 0.03, 0.02), rot = vec3(0.0, 0.0, -1.5) },
			usetime = 2500,
			cancel = true,
			notification = 'Изпи Вода'
		}
	},
	['energydrink'] = {
		label = 'Енергийна напитка',
		weight = 500,
		degrade = 2880,
		decay = true,
		client = {
			status = { thirst = 180000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_flow_bottle`, pos = vec3(0.03, 0.03, 0.02), rot = vec3(0.0, 0.0, -1.5) },
			usetime = 2500,
			cancel = true,
			notification = 'Изпи Енергийна напитка'
		}
	},
	['sprunk'] = {
		label = 'Спрънк',
		weight = 500,
		degrade = 2880,
		decay = true,
		client = {
			status = { thirst = 140000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_flow_bottle`, pos = vec3(0.03, 0.03, 0.02), rot = vec3(0.0, 0.0, -1.5) },
			usetime = 2500,
			cancel = true,
			notification = 'Пиеш Спрънк'
		}
	},
 
 
	-- Alcohols
	['vodka'] = {
		label = 'Водка',
		weight = 500,
		degrade = 2880,
		decay = true,
		client = {
			status = { drunk = 180000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'prop_bottle_richard', 
            pos = vec3(0.02, -0.01, -0.14), rot = vec3(1.0, 5.0, -182.5) },
            usetime = 7500,
		}
	},
	['burban'] = {
		label = 'Бърбън',
		weight = 500,
		degrade = 2880,
		decay = true,
		client = {
			status = { drunk = 180000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_flow_bottle`, pos = vec3(0.03, 0.03, 0.02), rot = vec3(0.0, 0.0, -1.5) },
			usetime = 2500,
			cancel = true,
			notification = 'Сръбна си Бърбън'
		}
	},
 
	-- Coffee
	['onion'] = {
		label = 'Лук',
		weight = 1000,
	},
	['chicken_thighs'] = {
		label = 'Пилешки бутчета',
		weight = 1000,
	},
	['virgin_olive_oil'] = {
		label = 'Зехтин',
		weight = 1000,
	},
	['rice'] = {
		label = 'Ориз',
		weight = 1000,
	},
	['pullman_bread'] = {
		label = 'Пулман хляб',
		weight = 1000,
	},
	['egg'] = {
		label = 'Яйце',
		weight = 1000,
	},
	['chicken_breast'] = {
		label = 'Пилешки гърди',
		weight = 1000,
	},
	['flour'] = {
		label = 'Брашно',
		weight = 1000,
	},
	['dried_boba_tapioca_pearls'] = {
		label = 'Сушени перли Боба Тапиока',
		weight = 1000,
	},
	['juice'] = {
		label = 'Сок',
		weight = 1000,
	},
	['lemon'] = {
		label = 'Лимон',
		weight = 1000,
	},
	['chicken'] = {
		label = 'Пилешко',
		weight = 1000,
	},
	['baking_powder'] = {
		label = 'Бакпулвер',
		weight = 1000,
	},
	['awwdorable_valentines_chocolate'] = {
		label = 'Шоколадово сърце',
		weight = 1000,
		degrade = 2880,
		decay = true,
	},
	['booba_milk_tea_1'] = {
		label = 'Боба мелчен шейк',
		weight = 1000,
	},
	['booba_milk_tea_2'] = {
		label = 'Боба мелчен шейк',
		weight = 1000,
		degrade = 2880,
		decay = true,
	},
	['brewed_coffe'] = {
		label = 'Смляно кафе',
		weight = 1000,
	},
	['cocoa_powder'] = {
		label = 'Какао на прах',
		weight = 1000,
	},
	['doki_doki_pancakes'] = {
		label = 'Палачинки',
		weight = 1000,
		degrade = 2880,
		decay = true,
	},
	['gingerkitty_cookie'] = {
		label = 'Бисквита',
		weight = 1000,
		degrade = 2880,
		decay = true,
	},
	['hamburg_stake'] = {
		label = 'Хамбургски стек',
		weight = 1000,
		degrade = 2880,
		decay = true,
		client = {image = "hamburg_steak.png",}
	},
	['lovely_hot_chocolate'] = {
		label = 'Горещ шоколад',
		weight = 1000,
		degrade = 2880,
		decay = true,
	},
	['matcha_powder'] = {
		label = 'Мача на прах',
		weight = 1000,
	},
	['matcha_coffee'] = {
		label = 'Мача кафе',
		weight = 1000,
		degrade = 2880,
		decay = true,
	},
	['meowchi_mochi_ice_cream'] = {
		label = 'Сладолед',
		weight = 1000,
		degrade = 2880,
		decay = true,
	},
	['noodles'] = {
		label = 'Нудли',
		weight = 1000,
	},
	['om_nom_omurice'] = {
		label = 'Омлет с ориз',
		weight = 1000,
		degrade = 2880,
		decay = true,
	},
	['nuts'] = {
		label = 'Фастъци',
		weight = 1000,
	},
	['rice_balls'] = {
		label = 'Оризова топка',
		weight = 1000,
		degrade = 2880,
		decay = true,
	},
	['rice_flour'] = {
		label = 'Оризово брашно',
		weight = 1000,
	},
	['sea_moss'] = {
		label = 'Морски мъх',
		weight = 1000,
	},
	['soy_sauce'] = {
		label = 'Соев Сос',
		weight = 1000,
	},
	['strawberry'] = {
		label = 'Ягода',
		weight = 1000,
	},
	['strawberry_shortcake'] = {
		label = 'Гуфрети',
		weight = 1000,
		degrade = 2880,
		decay = true,
	},
	['sugoi_katsu_sando'] = {
		label = 'Сандвич ',
		weight = 1000,
		degrade = 2880,
		decay = true,
	},
	['sweet_herbal_tea'] = {
		label = 'Билков чай',
		weight = 1000,
		degrade = 2880,
		decay = true,
	},
	['warm_chicken_noodle'] = {
		label = 'Топли пилешки нудли',
		weight = 1000,
		degrade = 2880,
		decay = true,
	},
	['glass_tall_dirty'] = {
		label = 'Мръсна голяма чаша',
		weight = 1000,
	},
	['bar_bowl_dirty'] = {
		label = 'Мръсна Купа',
		weight = 1000,
	},
	['bar_bowl'] = {
		label = 'Купа',
		weight = 1000,
	},
	['steak'] = {
		label = 'Стек',
		weight = 1000,
	},
	['oxygen_cake'] = {
		label = 'Торта',
		weight = 1000,
		degrade = 2880,
		decay = true,
	},
	['dragos_fire_cupcake'] = {
		label = 'Кексче Драконов Огън',
		weight = 1000,
		degrade = 2880,
		decay = true,
	},
	['kira_kira_currye'] = {
		label = 'Къри',
		weight = 1000,
		degrade = 2880,
		decay = true,
	},
	['purrfect_parfait_ballaberry'] = {
		label = 'Мърр боровинково десертче',
		weight = 1000,
	},
	['ballbarry_cupcake'] = {
		label = 'Боровинково кексче',
		weight = 1000,
		degrade = 2880,
		decay = true,
	},
	['purrfect_parfait'] = {
		label = 'Мелба',
		weight = 1000,
		degrade = 2880,
		decay = true,
	},
	['cat_macaroon_brown'] = {
		label = 'Кафяв макарон',
		weight = 1000,
		degrade = 2880,
		decay = true,
	},
	['cat_macaroon_green'] = {
		label = 'Зелен Макарон',
		weight = 1000,
		degrade = 2880,
		decay = true,
	},
	['cat_macaroon_pink'] = {
		label = 'Розов макарон',
		weight = 1000,
		degrade = 2880,
		decay = true,
	},
	['cat_macaroon_turquoise'] = {
		label = 'Тюркоазен макарон',
		weight = 1000,
		degrade = 2880,
		decay = true,
	},
	['brown_dye'] = {
		label = 'Кафява боя',
		weight = 1000,
	},
	['pink_dye'] = {
		label = 'Розова боя',
		weight = 1000,
	},
	['green_dye'] = {
		label = 'Зелена боя',
		weight = 1000,
	},
	['turquoise_dye'] = {
		label = 'Тюркоазена боя',
		weight = 1000,
	},
	['plate2'] = {
		label = 'Чиния',
		weight = 1000,
	},
	['cup_dirty'] = {
		label = 'Мръсна чаша',
		weight = 1000,
	},
	['plate_dirty'] = {
		label = 'Мръсна чиния',
		weight = 1000,
	},
	['ice'] = {
		label = 'Лед',
		weight = 1000,
	},
	['brewed_coffee'] = {
		label = 'Мляно кафе',
		weight = 1000,
	},

	-- Bean Machine
	['affogato'] = {
		label = 'Кафе мелба',
		weight = 10,
		degrade = 2880,
		decay = true,
		stack = true,
		close = true,
	},
	['blackberry'] = {
		label = 'Къпина',
		weight = 10,
		degrade = 2880,
		decay = true,
		stack = true,
		close = true,
	},
	['blackberry_muffin'] = {
		label = 'Къпинов мъфин',
		weight = 10,
		degrade = 2880,
		decay = true,
		stack = true,
		close = true,
	},
	['butter'] = {
		label = 'Масло',
		weight = 10,
		degrade = 2880,
		decay = true,
		stack = true,
		close = true,
	},
	['cappuccino'] = {
		label = 'Капочино',
		weight = 10,
		degrade = 2880,
		decay = true,
		stack = true,
		close = true,
	},
	['coffee_beans'] = {
		label = 'Кафени зърна',
		weight = 10,
		degrade = 2880,
		decay = true,
		stack = true,
		close = true,
	},
	['coffee_cup'] = {
		label = 'Чаша за кафе',
		weight = 10,
		degrade = 2880,
		decay = true,
		stack = true,
		close = true,
	},
	['crema'] = {
		label = 'Крема',
		weight = 10,
		degrade = 2880,
		decay = true,
		stack = true,
		close = true,
	},
	['cup'] = {
		label = 'Чаша',
		weight = 10,
		degrade = 2880,
		decay = true,
		stack = true,
		close = true,
	},
	['dirty_glass'] = {
		label = 'Мръсна Чаша',
		weight = 10,
		degrade = 2880,
		decay = true,
		stack = true,
		close = true,
	},
	['dirty_latte_cup'] = {
		label = 'Мръсна Чаша за Лате',
		weight = 10,
		degrade = 2880,
		decay = true,
		stack = true,
		close = true,
	},
	['dirty_plate'] = {
		label = 'Мръсна чиния',
		weight = 10,
		degrade = 2880,
		decay = true,
		stack = true,
		close = true,
	},
	['donut'] = {
		label = 'Донът',
		weight = 10,
		degrade = 2880,
		decay = true,
		stack = true,
		close = true,
	},
	['espresso'] = {
		label = 'Еспресо',
		weight = 10,
		degrade = 2880,
		decay = true,
		stack = true,
		close = true,
	},
	['flatwhite'] = {
		label = 'Кафе с мляко',
		weight = 10,
		degrade = 2880,
		decay = true,
		stack = true,
		close = true,
	},
	['glass'] = {
		label = 'Чаша',
		weight = 10,
		degrade = 2880,
		decay = true,
		stack = true,
		close = true,
	},
	['greenleaf'] = {
		label = 'Зелено листо',
		weight = 10,
		degrade = 2880,
		decay = true,
		stack = true,
		close = true,
	},
	['greentea'] = {
		label = 'Зелен чай',
		weight = 10,
		degrade = 2880,
		decay = true,
		stack = true,
		close = true,
	},
	['ham'] = {
		label = 'Шунка',
		weight = 10,
		degrade = 2880,
		decay = true,
		stack = true,
		close = true,
	},
	['hot_chocolate'] = {
		label = 'Горещ шоколад',
		weight = 10,
		degrade = 2880,
		decay = true,
		stack = true,
		close = true,
	},
	['cheese'] = {
		label = 'Кашкавал',
		weight = 10,
		degrade = 2880,
		decay = true,
		stack = true,
		close = true,
	},
	['chocolate'] = {
		label = 'Шоколад',
		weight = 10,
		degrade = 2880,
		decay = true,
		stack = true,
		close = true,
	},
	['chocolate_donut'] = {
		label = 'Шоколадов Донът',
		weight = 10,
		degrade = 2880,
		decay = true,
		stack = true,
		close = true,
	},
	['chocolate_muffin'] = {
		label = 'Шоколадов Мъфин',
		weight = 10,
		degrade = 2880,
		decay = true,
		stack = true,
		close = true,
	},
	['chocolate_topping'] = {
		label = 'Шоколадов топинг',
		weight = 10,
		degrade = 2880,
		decay = true,
		stack = true,
		close = true,
	},
	['icecream'] = {
		label = 'Сладолед',
		weight = 10,
		degrade = 2880,
		decay = true,
		stack = true,
		close = true,
	},
	['irish'] = {
		label = 'Ирландско кафе',
		weight = 10,
		degrade = 2880,
		decay = true,
		stack = true,
		close = true,
	},
	['jasmine'] = {
		label = 'Жасмин',
		weight = 10,
		degrade = 2880,
		decay = true,
		stack = true,
		close = true,
	},
	['jasminetea'] = {
		label = 'Жасминов чай',
		weight = 10,
		degrade = 2880,
		decay = true,
		stack = true,
		close = true,
	},
	['latte_cup'] = {
		label = 'Чаша за лате',
		weight = 10,
		degrade = 2880,
		decay = true,
		stack = true,
		close = true,
	},
	['latte_macchiato'] = {
		label = 'Лате макиато',
		weight = 10,
		degrade = 2880,
		decay = true,
		stack = true,
		close = true,
	},
	['lemon_crushedice'] = {
		label = 'Лимонова вода',
		weight = 10,
		degrade = 2880,
		decay = true,
		stack = true,
		close = true,
	},
	['lungo'] = {
		label = 'Лунго',
		weight = 10,
		degrade = 2880,
		decay = true,
		stack = true,
		close = true,
	},
	['lychee'] = {
		label = 'Личи',
		weight = 10,
		degrade = 2880,
		decay = true,
		stack = true,
		close = true,
	},
	['lychee_muffin'] = {
		label = 'Личи Мъфин',
		weight = 10,
		degrade = 2880,
		decay = true,
		stack = true,
		close = true,
	},
	['milk'] = {
		label = 'Мляко',
		weight = 10,
		degrade = 2880,
		decay = true,
		stack = true,
		close = true,
	},
	['mint'] = {
		label = 'Мента',
		weight = 10,
		degrade = 2880,
		decay = true,
		stack = true,
		close = true,
	},
	['minttea'] = {
		label = 'Ментов Чай',
		weight = 10,
		degrade = 2880,
		decay = true,
		stack = true,
		close = true,
	},
	['muffin'] = {
		label = 'Мъфин',
		weight = 10,
		degrade = 2880,
		decay = true,
		stack = true,
		close = true,
	},
	['muffin_cups'] = {
		label = 'Мъфин Чашки',
		weight = 10,
		degrade = 2880,
		decay = true,
		stack = true,
		close = true,
	},
	['multivitamin_crushedice'] = {
		label = 'Мултивитаминов строшен лед',
		weight = 10,
		degrade = 2880,
		decay = true,
		stack = true,
		close = true,
	},
	['oreo'] = {
		label = 'Орео',
		weight = 10,
		degrade = 2880,
		decay = true,
		stack = true,
		close = true,
	},
	['oreo_muffin'] = {
		label = 'Орео Мъфин',
		weight = 10,
		degrade = 2880,
		decay = true,
		stack = true,
		close = true,
	},
	['peanuts_sprinkles'] = {
		label = 'Фъстъци топинг',
		weight = 10,
		degrade = 2880,
		decay = true,
		stack = true,
		close = true,
	},
	['pink_donut'] = {
		label = 'Розова Поничка',
		weight = 10,
		degrade = 2880,
		decay = true,
		stack = true,
		close = true,
	},
	['pink_topping'] = {
		label = 'Розов топинг',
		weight = 10,
		degrade = 2880,
		decay = true,
		stack = true,
		close = true,
	},
	['plate'] = {
		label = 'Чиния',
		weight = 10,
		degrade = 2880,
		decay = true,
		stack = true,
		close = true,
	},
	['rainbow_sprinkles'] = {
		label = 'Разноцветни пръски',
		weight = 10,
		degrade = 2880,
		decay = true,
		stack = true,
		close = true,
	},
	['ristretto'] = {
		label = 'Ризето кафе',
		weight = 10,
		degrade = 2880,
		decay = true,
		stack = true,
		close = true,
	},
	['sugar'] = {
		label = 'Захар',
		weight = 10,
		degrade = 2880,
		decay = true,
		stack = true,
		close = true,
	},
	['toast'] = {
		label = 'Тост',
		weight = 10,
		degrade = 2880,
		decay = true,
		stack = true,
		close = true,
	},
	['toast_bread'] = {
		label = 'Хляб за Тост',
		weight = 10,
		degrade = 2880,
		decay = true,
		stack = true,
		close = true,
	},
	['turkish_coffee'] = {
		label = 'Турско кафе',
		weight = 10,
		degrade = 2880,
		decay = true,
		stack = true,
		close = true,
	},
	['turkish_coffee_beans'] = {
		label = 'Турски кафени зърна',
		weight = 10,
		degrade = 2880,
		decay = true,
		stack = true,
		close = true,
	},
	['vanilla_donut'] = {
		label = 'Ванилов Донът',
		weight = 10,
		degrade = 2880,
		decay = true,
		stack = true,
		close = true,
	},
	['whiskey'] = {
		label = 'Уиски',
		weight = 10,
		degrade = 2880,
		decay = true,
		stack = true,
		close = true,
	},
	['white_topping'] = {
		label = 'Бял топинг',
		weight = 10,
		degrade = 2880,
		decay = true,
		stack = true,
		close = true,
	},
 
	-- Medical Stuff
	['bandage'] = {
		label = 'Превръзка',
		weight = 115,
		client = {
			anim = { dict = 'missheistdockssetup1clipboard@idle_a', clip = 'idle_a', flag = 49 },
			prop = { model = `prop_rolled_sock_02`, pos = vec3(-0.14, -0.14, -0.08), rot = vec3(-50.0, -50.0, 0.0) },
			disable = { move = true, car = true, combat = true },
			usetime = 2500,
		}
	},
 
	-- Police Job
	["handcuffs"] = { label = "Белезници", weight = 100, stack = true, close = true, description = "Белезници", client = {image = "broken_handcuffs.png",}},
	["broken_handcuffs"] = { label = "Broken handcuffs", weight = 100, stack = true, close = true, description = "It's broken, maybe you can repair it?", client = {image = "broken_handcuffs.png",}},
    ["cuffkeys"] = { label = "Cuff Keys", weight = 75, stack = true, close = true, description = "Set them free !", client = {image = "cuffkeys.png",}},
    ["ziptie"] = { label = "Ziptie", weight = 50, stack = true, close = true, description = "Comes in handy when people misbehave. Maybe it can be used for something else?", client = {image = "ziptie.png",}},
    ["flush_cutter"] = { label = "Flush Cutter", weight = 50, stack = true, close = true, description = "Comes in handy when you want to cut zipties..", client = {image = "flush_cutter.png",}},
    ["bolt_cutter"] = { label = "Bolt Cutter", weight = 50, stack = true, close = true, description = "Wanna cut some metal items ?", client = {image = "bolt_cutter.png",}},
    ["leo_gps"] = { label = "LEO GPS", weight = 200, stack = true, close = true, description = "Show your gps location to others", client = {image = "leo-gps.png",}},
    ["alcoholtester"] = { label = "Alcohol Tester", weight = 400, stack = false, close = true, description = "For testing purposes..", client = {image = "alcoholtester.png",}},
	['armour2'] = {
		label = 'Полицейска бронежилетка',
		weight = 2000,
		stack = true,
		client = {
			anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
			usetime = 3000
		}
	},
	['police_stormram'] = {
		label = 'Полицейски таран',
		weight = 1000,
		stack = false,
	},
	["filled_evidence_bag"] = {
		label = "Плик с доказателства",
		weight = 200,
		stack = false,
		close = true,
		description = "Пълен плик с доказателства >:(",
		client = {
			image = "evidence.png",
		}
	},
 
	['empty_evidence_bag'] = {
		label = 'Празен плик с доказателства',
		weight = 1000,
	},
 
	-- Dusa Mechanic
	['repairkit'] = {
		label = 'Ремонтен комплект',
		weight = 1000,
	},
	['cleaningkit'] = {
		label = 'Почистващ комплект',
		weight = 1000,
	},
	['tyrekit'] = {
		label = 'Комплек за гуми',
		weight = 1000,
	},
	['wheel'] = {
		label = 'Гума',
		weight = 1000,
	},
	['tuningtablet'] = {
		label = 'Тунинг Таблет',
		weight = 1000,
	},
	['nitrous'] = {
		label = 'Нитро',
		weight = 1000,
	},
	-- ['plate'] = {
	-- 	label = 'Номер за автомобил',
	-- 	weight = 1000,
	-- },
	['carlift'] = {
		label = 'Крик',
		weight = 1000,
	},
 
 
	-- Crime items
	['joint'] = {
		label = 'Джоинт',
		weight = 500,
		degrade = 1440,
		decay = true,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' }, -- fix
			prop = { model = `prop_ld_flow_bottle`, pos = vec3(0.03, 0.03, 0.02), rot = vec3(0.0, 0.0, -1.5) }, -- fix
			usetime = 2500,
			cancel = true,
			notification = 'Пушиш джоинт'
		}
	},
	['armour'] = {
		label = 'Бронежилетка',
		weight = 2500,
		stack =  true,
		client = {
			anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
			usetime = 3500
		}
	},
	['drill'] = {
		label = 'Бормашина',
		weight = 200,
		image = 'drill.png',
	},
	['drilllvl2'] = {
		label = 'Лазерна Бормашина',
		weight = 200,
		image = 'drilllvl2.png',
	},
	['hackingchip'] = {
		label = 'Чип',
		weight = 200,
		image = 'hackingchip.png',
	},
	['hackingdevice2'] = {
		label = 'Хакващо Устройство',
		weight = 200,
		image = 'hackingdevice.png',
	},
	['hackinglaptop'] = {
		label = 'Лаптоп за хакване',
		weight = 200,
		image = 'hackinglaptop.png',
	},
	['smallbomb'] = {
		label = 'Малка Бомба',
		weight = 200,
		image = 'smallbomb.png',
	},
	['bigbomb'] = {
		label = 'Голяма бомба',
		weight = 200,
		image = 'bigbomb.png',
	},
	['debitcard'] = {
		label = 'Дебитна Карта',
		weight = 200,
		image = 'debitcard.png',
	},
	['plasma'] = {
		label = 'Плазма',
		weight = 200,
		image = 'plasma.png',
	},
	['recipe_1'] = {
		label = 'Тайна рецепта',
		weight = 200,
		image = 'recipe_1.png',
		buttons = {
					{
						label = 'Прочети',
						action = function(slot)
							QBCore.Functions.Notify("Псевдоефедрин 9, Азот 8, Кислород 7", "info", 5000)
						end
					},
		}
	},
	['recipe_2'] = {
		label = 'Тайна рецепта',
		weight = 200,
		image = 'recipe_1.png',
		buttons = {
					{
						label = 'Прочети',
						action = function(slot)
							QBCore.Functions.Notify("Листа от кока 6, Червена сяра 3, Празен плик 5", "info", 5000)
						end
					},
		}
	},
	['recipe_3'] = {
		label = 'Тайна рецепта',
		weight = 200,
		image = 'recipe_1.png',
		buttons = {
					{
						label = 'Прочети',
						action = function(slot)
							QBCore.Functions.Notify("Празен плик 5, Солна киселина 6, Течна сяра 7", "info", 5000)
						end
					},
		}
	},
	['recipe_4'] = {
		label = 'Тайна рецепта',
		weight = 200,
		image = 'recipe_1.png',
		buttons = {
					{
						label = 'Прочети',
						action = function(slot)
							QBCore.Functions.Notify("Вода 8, , Амониев нитрат 7, Натриев хидроксид 3, Псевдоефедрин 2", "info", 5000)
						end
					},
		}
	},
	-- Drugs
	['drug_lsd'] = {
		label = 'LSD',
		weight = 1000,
	},
	['drug_ecstasy'] = {
		label = 'Екстази',
		weight = 1000,
	},
	['drug_lean'] = {
		label = 'Lean',
		weight = 1000,
	},
	-- Misc
	['parachute'] = {
		label = 'Парашут',
		weight = 8000,
		stack = false,
		client = {
			anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
			usetime = 1500
		}
	},
	['clothing_bag'] = {
		label = 'Чанта за преобличане',
		weight = 1000,
	},
	['lockpick'] = {
		label = 'Шперц',
		weight = 160,
	},
	['money'] = {
		label = 'Пари',
	},
	['radio'] = {
		label = 'Радио',
		weight = 1000,
		stack = false,
		allowArmed = true
	},
	["phone"] = {
		label = "Телефон",
		weight = 190,
		stack = false,
		consume = 0,
		client = {
			export = "lb-phone.UsePhoneItem",
			remove = function()
				TriggerEvent("lb-phone:itemRemoved")
			end,
			add = function()
				TriggerEvent("lb-phone:itemAdded")
			end
		}
	},
	['powerbank'] = {
		label = 'Преносима Батерия',
		weight = 1000,
		stack = false,
	},
	['radio_battery'] = {
		label = 'Радио Батерия',
		weight = 500,
		stack = false,
	},
	['radio_broken'] = {
		label = 'Счупено Радио',
		weight = 1000,
		stack = false,
	},
	['dry_rice'] = {
		label = 'Ориз',
		weight = 250,
		stack = true,
	},
 
	-- Documents
	["id_card"] = {
		label = "Лична карта",
		weight = 0,
		stack = false,
		close = false,
		description = "Карта която съдържа всичката твоя информация",
	},
 
    ["driver_license"] = {
		label = "Шофьорска книжка",
		weight = 0,
		stack = false,
		close = false,
		description = "Докомент който показва че можеш да шофираш",
	},
 
	["weaponlicense"] = {
		label = "Лиценз за оръжие",
		weight = 0,
		stack = false,
		close = true,
		description = "Докомент който показва че притежавате законно оръжие",
	},
	['contract'] = {
		label = 'Договор за МПС',
		weight = 1000,
	},
 
	-- Fishing missing weights
	['anchovy'] = {
		label = 'Аншуа',
		weight = 160,
	},
	['artificial_bait'] = {
		label = 'Изкуствена примамка',
		weight = 160,
	},
	['basic_rod'] = {
		label = 'Обикновенна въдица',
		weight = 160,
	},
	['graphite_rod'] = {
		label = 'Карбонова въдица',
		weight = 160,
	},
	['grouper'] = {
		label = 'Групер',
		weight = 160,
	},
	['haddock'] = {
		label = 'Треска',
		weight = 160,
	},
	['mahi_mahi'] = {
		label = 'Делфинова риба',
		weight = 160,
	},
	['piranha'] = {
		label = 'Жаба',
		weight = 160,
	},
	['red_snapper'] = {
		label = 'Червеноперка',
		weight = 160,
	},
	['salmon'] = {
		label = 'Сьомга',
		weight = 160,
	},
	['shark'] = {
		label = 'Акула',
		weight = 160,
	},
	['titanium_rod'] = {
		label = 'Титаниева въдица',
		weight = 160,
	},
	['trout'] = {
		label = 'Пъстърва',
		weight = 160,
	},
	['tuna'] = {
		label = 'Риба тон',
		weight = 160,
	},
	['worms'] = {
		label = 'Червей',
		weight = 1,
	},
 
	-- Recycle
	['iron'] = {
		label = 'Желязо',
		weight = 15,
		image = 'iron.png',
	},
	['copper'] = {
		label = 'Мед',
		weight = 15,
		image = 'copper.png',
	},
	['gunpowder'] = {
		label = 'Барут',
		weight = 50,
		image = 'gunpowder.png',
	},
	['plastic'] = {
		label = 'Платмаса',
		weight = 10,
		image = 'plastic.png',
	},
	['metalscrap'] = {
		label = 'Метал Скрап',
		weight = 15,
		image = 'metalscrap.png',
	},
	['usb'] = {
		label = 'USB флашка',
		weight = 200,
		image = 'usb.png',
	},
	['oldcash'] = {
		label = 'Стари банкноти',
		image = 'oldcash.png',
	},
	['solderingiron'] = {
		label = 'Поялник',
		weight = 1000,
		image = 'solderingiron.png',
	},
 
	-- Fuel
	['jerrycan'] = {
		label = 'Туба с гориво',
		image = 'jerrycan.png',
	},
 
	-- ['testburger'] = {
	-- 	label = 'Test Burger',
	-- 	weight = 220,
	-- 	degrade = 1440,
	-- 	client = {
	-- 		image = 'burger_chicken.png',
	-- 		status = { hunger = 200000 },
	-- 		anim = 'eating',
	-- 		prop = 'burger',
	-- 		usetime = 2500,
	-- 		export = 'ox_inventory_examples.testburger'
	-- 	},
	-- 	server = {
	-- 		export = 'ox_inventory_examples.testburger',
	-- 		test = 'what an amazingly delicious burger, amirite?'
	-- 	},
	-- 	buttons = {
	-- 		{
	-- 			label = 'Lick it',
	-- 			action = function(slot)
	-- 				print('You licked the burger')
	-- 			end
	-- 		},
	-- 		{
	-- 			label = 'Squeeze it',
	-- 			action = function(slot)
	-- 				print('You squeezed the burger :(')
	-- 			end
	-- 		},
	-- 		{
	-- 			label = 'What do you call a vegan burger?',
	-- 			group = 'Hamburger Puns',
	-- 			action = function(slot)
	-- 				print('A misteak.')
	-- 			end
	-- 		},
	-- 		{
	-- 			label = 'What do frogs like to eat with their hamburgers?',
	-- 			group = 'Hamburger Puns',
	-- 			action = function(slot)
	-- 				print('French flies.')
	-- 			end
	-- 		},
	-- 		{
	-- 			label = 'Why were the burger and fries running?',
	-- 			group = 'Hamburger Puns',
	-- 			action = function(slot)
	-- 				print('Because they\'re fast food.')
	-- 			end
	-- 		}
	-- 	},
	-- 	consume = 0.3
	-- },
 
	["mininglaser"] = {
		label = "Лазер за копане",
		weight = 900,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "mininglaser.png",
		}
	},
 
	["silverearring"] = {
		label = "Сребърни обеци",
		weight = 200,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "silver_earring.png",
		}
	},
 
	["diamond_necklace"] = {
		label = "Диамантена огърлица",
		weight = 200,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "diamond_necklace.png",
		}
	},
 
	["ruby_necklace"] = {
		label = "Рубинова огърлица",
		weight = 200,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "ruby_necklace.png",
		}
	},
 
	["diamond_earring"] = {
		label = "Диамантени обеци",
		weight = 200,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "diamond_earring.png",
		}
	},
 
	["ruby_necklace_silver"] = {
		label = "Рубинова сребърна огърлица",
		weight = 200,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "ruby_necklace_silver.png",
		}
	},
	["emerald_earring"] = {
		label = "Емералдни обеци",
		weight = 200,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "emerald_earring.png",
		}
	},
 
	["ruby_ring_silver"] = {
		label = "Робинов сребърен пръстен",
		weight = 200,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "ruby_ring_silver.png",
		}
	},
 
	["pickaxe"] = {
		label = "Кирка",
		weight = 1000,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "pickaxe.png",
		}
	},
 
	["uncut_sapphire"] = {
		label = "Неизрязан сапфир",
		weight = 100,
		stack = true,
		close = false,
		description = "A rough Sapphire",
		client = {
			image = "uncut_sapphire.png",
		}
	},
 
	["miningdrill"] = {
		label = "Дрелка за копане",
		weight = 1000,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "miningdrill.png",
		}
	},
 
	["ironore"] = {
		label = "Желязна руда",
		weight = 1000,
		stack = true,
		close = false,
		description = "Iron, a base ore.",
		client = {
			image = "ironore.png",
		}
	},
 
	["goldchain"] = {
		label = "Златен ланец",
		weight = 200,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "goldchain.png",
		}
	},
 
	["silverchain"] = {
		label = "сребърен ланец",
		weight = 200,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "silverchain.png",
		}
	},
 
	["ruby_earring"] = {
		label = "Рубинови обеци",
		weight = 200,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "ruby_earring.png",
		}
	},
 
	["ruby_earring_silver"] = {
		label = "Рубинови Сребърни обеци",
		weight = 200,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "ruby_earring_silver.png",
		}
	},
 
	["drillbit"] = {
		label = "Бургия",
		weight = 10,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "drillbit.png",
		}
	},
 
	["emerald_earring_silver"] = {
		label = "Емералдни сребърни обеци",
		weight = 200,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "emerald_earring_silver.png",
		}
	},
 
	["sapphire_earring_silver"] = {
		label = "Сапфирни сребърни обеци",
		weight = 200,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "sapphire_earring_silver.png",
		}
	},
 
	["diamond_earring_silver"] = {
		label = "Диамантени сребърни обеци",
		weight = 200,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "diamond_earring_silver.png",
		}
	},
 
	["sapphire_earring"] = {
		label = "Сапфирни обеци",
		weight = 200,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "sapphire_earring.png",
		}
	},
 
	["goldpan"] = {
		label = "Съд за топене на злато",
		weight = 10,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "goldpan.png",
		}
	},
 
	["sapphire"] = {
		label = "Сапфир",
		weight = 100,
		stack = true,
		close = false,
		description = "A Sapphire that shimmers",
		client = {
			image = "sapphire.png",
		}
	},
 
	["ruby_ring"] = {
		label = "Рубинов пръстен",
		weight = 200,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "ruby_ring.png",
		}
	},
 
	["goldingot"] = {
		label = "Златно килче",
		weight = 1000,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "goldingot.png",
		}
	},
 
	["uncut_ruby"] = {
		label = "Неизрязан рубин",
		weight = 100,
		stack = true,
		close = false,
		description = "A rough Ruby",
		client = {
			image = "uncut_ruby.png",
		}
	},
 
	["emerald_necklace"] = {
		label = "Емералдна огърлица",
		weight = 200,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "emerald_necklace.png",
		}
	},
 
	["copperore"] = {
		label = "Медна руда",
		weight = 1000,
		stack = true,
		close = false,
		description = "Copper, a base ore.",
		client = {
			image = "copperore.png",
		}
	},
 
	["gold_ring"] = {
		label = "Златен пръстен",
		weight = 200,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "gold_ring.png",
		}
	},
 
	["silverore"] = {
		label = "Сребърна руда",
		weight = 1000,
		stack = true,
		close = false,
		description = "Silver Ore",
		client = {
			image = "silverore.png",
		}
	},
 
	["emerald_necklace_silver"] = {
		label = "Емералдна сребърна огърлица ",
		weight = 200,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "emerald_necklace_silver.png",
		}
	},
 
	["stone"] = {
		label = "Камък",
		weight = 400,
		stack = true,
		close = false,
		description = "Stone woo",
		client = {
			image = "stone.png",
		}
	},
 
	["diamond_ring_silver"] = {
		label = "Диамантен сребърен пръстен",
		weight = 200,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "diamond_ring_silver.png",
		}
	},
 
	["sapphire_necklace_silver"] = {
		label = "Сапфирена сребърна огърлица",
		weight = 200,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "sapphire_necklace_silver.png",
		}
	},
 
	["emerald"] = {
		label = "Емералд",
		weight = 100,
		stack = true,
		close = false,
		description = "A Emerald that shimmers",
		client = {
			image = "emerald.png",
		}
	},
 
	["uncut_emerald"] = {
		label = "Неизрязан емералд",
		weight = 100,
		stack = true,
		close = false,
		description = "A rough Emerald",
		client = {
			image = "uncut_emerald.png",
		}
	},
 
	["can"] = {
		label = "Празно кенче",
		weight = 10,
		stack = true,
		close = false,
		description = "An empty can, good for recycling",
		client = {
			image = "can.png",
		}
	},
 
	["silveringot"] = {
		label = "Сребърна руда",
		weight = 1000,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "silveringot.png",
		}
	},
 
	["diamond"] = {
		label = "Диамант!",
		weight = 100,
		stack = true,
		close = false,
		description = "A Diamond that shimmers",
		client = {
			image = "diamond.png",
		}
	},
 
	["emerald_ring"] = {
		label = "Емералден пръстен",
		weight = 200,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "emerald_ring.png",
		}
	},
 
	["goldearring"] = {
		label = "Златни обици",
		weight = 200,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "gold_earring.png",
		}
	},
 
	["uncut_diamond"] = {
		label = "Неизрязан диамант",
		weight = 100,
		stack = true,
		close = false,
		description = "A rough Diamond",
		client = {
			image = "uncut_diamond.png",
		}
	},
 
	["emerald_ring_silver"] = {
		label = "Емералден сребърен пръстен",
		weight = 200,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "emerald_ring_silver.png",
		}
	},
 
	["ruby"] = {
		label = "Рубин",
		weight = 100,
		stack = true,
		close = false,
		description = "Рубинче брато",
		client = {
			image = "ruby.png",
		}
	},
 
	["diamond_ring"] = {
		label = "Диамантен пръстен",
		weight = 200,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "diamond_ring.png",
		}
	},
 
	["bottle"] = {
		label = "Празена бутилка",
		weight = 10,
		stack = true,
		close = false,
		description = "Стъклена бутилка",
		client = {
			image = "bottle.png",
		}
	},
 
	["diamond_necklace_silver"] = {
		label = "Диамантна сребърна огърлица",
		weight = 200,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "diamond_necklace_silver.png",
		}
	},
 
	["sapphire_ring_silver"] = {
		label = "Сапфирен сребърен пръстен",
		weight = 200,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "sapphire_ring_silver.png",
		}
	},
 
	["sapphire_necklace"] = {
		label = "Сапфирна огърлица",
		weight = 200,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "sapphire_necklace.png",
		}
	},
 
	["goldore"] = {
		label = "Златна руда",
		weight = 1000,
		stack = true,
		close = false,
		description = "Златна руда",
		client = {
			image = "goldore.png",
		}
	},
 
	["sapphire_ring"] = {
		label = "Сапфирен пръстен",
		weight = 200,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "sapphire_ring.png",
		}
	},
 
	["silver_ring"] = {
		label = "Сребърен пръстен",
		weight = 200,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "silver_ring.png",
		}
	},
 
	-- ["usbcable"] = {
	-- 	label = "USB Кабел",
	-- 	weight = 20,
	-- 	stack = false,
	-- 	close = true,
	-- 	description = "",
	-- 	client = {
	-- 		image = "powerbank.png",
	-- 	}
	-- },
 
	--Drugs Creator
 
	["codein"] = {
		label = "Кодеин",
		weight = 20,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "silver_ring.png",
		}
	},
	["liquid_sulfur"] = {
		label = "Течна сяра",
		weight = 20,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "silver_ring.png",
		}
	},
	["ammonium_nitrate"] = {
		label = "Амониев нитрат",
		weight = 20,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "silver_ring.png",
		}
	},
	["sodium_hydroxide"] = {
		label = "Натриев хидроксид",
		weight = 20,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "sodium_hydroxide.png",
		}
	},
	["pseudoefedrine"] = {
		label = "Псевдоефедрин",
		weight = 20,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "silver_ring.png",
		}
	},
	["carbon"] = {
        label = "Карбон",
        weight = 20,
        stack = true,
        close = false,
        description = "",
        client = {
            image = "silver_ring.png",
		}
	},
	["hydrogen"] = {
		label = "Водород",
		weight = 20,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "silver_ring.png",
		}
	},
	["nitrogen"] = {
		label = "Азот",
		weight = 20,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "nitrogenbottle.png",
		}
	},
	["oxygen"] = {
		label = "Кислород",
		weight = 20,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "oxygenbottle.png",
		}
	},
	["rolling_paper"] = {
		label = "Хартийки за сгъване",
		weight = 20,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "rolling_paper.png",
		}
	},
	["weed_purplehaze_seed"] = {
		label = "weed purple haze seed",
		weight = 20,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "weed_pooch.png",
		}
	},
	["cocaine"] = {
		label = "Кокаин",
		weight = 20,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "cocapicture.png",
		}
	},
	["coca_leaf"] = {
		label = "Кокаинови листа",
		weight = 20,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "coca_leaf.png",
		}
	},
	["drug_meth"] = {
		label = "Метичка",
		weight = 20,
		stack = true,
		close = false,
		description = "Метичка брато",
		client = {
			image = "meth.png",
		}
	},
	["red_sulfur"] = {
		label = "Червена сяра",
		weight = 20,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "silver_ring.png",
		}
	},
	["muriatic_acid"] = {
		label = "Солна киселина",
		weight = 20,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "silver_ring.png",
		}
	},
	["grinder"] = {
		label = "Грайндер",
		weight = 20,
		stack = true,
		close = false,
		description = "Да гриндиш",
		client = {
			image = "grinderpicture.png",
		}
	},
	["weed_purplehaze"] = {
		label = "Purplehaze",
		weight = 20,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "purplejoint.png",
		}
	},
	["spacebag"] = {
		label = "Празен плик",
		weight = 20,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "spacebag.png",
		}
	},

	["painkillers"] = {
		label = "Painkillers",
		weight = 0,
		stack = true,
		close = true,
		description = "For pain you can't stand anymore, take this pill that'd make you feel great again",
		client = {
			image = "painkillers.png",
		}
	},

	["radioscanner"] = {
		label = "Radio Scanner",
		weight = 1000,
		stack = true,
		close = true,
		description = "With this you can get some police alerts. Not 100% effective however",
		client = {
			image = "radioscanner.png",
		}
	},

	["coke_small_brick"] = {
		label = "Coke Package",
		weight = 350,
		stack = false,
		close = true,
		description = "Small package of cocaine, mostly used for deals and takes a lot of space",
		client = {
			image = "coke_small_brick.png",
		}
	},

	["wine"] = {
		label = "Wine",
		weight = 300,
		stack = true,
		close = false,
		description = "Some good wine to drink on a fine evening",
		client = {
			image = "wine.png",
		}
	},

	["markedbills"] = {
		label = "Marked Money",
		weight = 1000,
		stack = false,
		close = true,
		description = "Money?",
		client = {
			image = "markedbills.png",
		}
	},

	["veh_brakes"] = {
		label = "Brakes",
		weight = 1000,
		stack = true,
		close = true,
		description = "Upgrade vehicle brakes",
		client = {
			image = "veh_brakes.png",
		}
	},

	["lighter"] = {
		label = "Lighter",
		weight = 0,
		stack = true,
		close = true,
		description = "On new years eve a nice fire to stand next to",
		client = {
			image = "lighter.png",
		}
	},

	["water_bottle"] = {
		label = "Bottle of Water",
		weight = 500,
		stack = true,
		close = true,
		description = "For all the thirsty out there",
		client = {
			image = "water_bottle.png",
		}
	},

	["meth"] = {
		label = "Meth",
		weight = 100,
		stack = true,
		close = true,
		description = "A baggie of Meth",
		client = {
			image = "meth_baggy.png",
		}
	},

	["certificate"] = {
		label = "Certificate",
		weight = 0,
		stack = true,
		close = true,
		description = "Certificate that proves you own certain stuff",
		client = {
			image = "certificate.png",
		}
	},

	["gatecrack"] = {
		label = "Gatecrack",
		weight = 0,
		stack = true,
		close = true,
		description = "Handy software to tear down some fences",
		client = {
			image = "usb_device.png",
		}
	},

	["stickynote"] = {
		label = "Sticky note",
		weight = 0,
		stack = false,
		close = false,
		description = "Sometimes handy to remember something :)",
		client = {
			image = "stickynote.png",
		}
	},

	["oxy"] = {
		label = "Prescription Oxy",
		weight = 0,
		stack = true,
		close = true,
		description = "The Label Has Been Ripped Off",
		client = {
			image = "oxy.png",
		}
	},

	["firework4"] = {
		label = "Weeping Willow",
		weight = 1000,
		stack = true,
		close = true,
		description = "Fireworks",
		client = {
			image = "firework4.png",
		}
	},

	["suppressor_attachment"] = {
		label = "Suppressor",
		weight = 1000,
		stack = true,
		close = true,
		description = "A suppressor for a weapon",
		client = {
			image = "suppressor_attachment.png",
		}
	},

	["precision_muzzle_brake"] = {
		label = "Precision Muzzle Brake",
		weight = 1000,
		stack = true,
		close = true,
		description = "A muzzle brake for a weapon",
		client = {
			image = "precision_muzzle_brake.png",
		}
	},

	["ifaks"] = {
		label = "ifaks",
		weight = 200,
		stack = true,
		close = true,
		description = "ifaks for healing and a complete stress remover.",
		client = {
			image = "ifaks.png",
		}
	},

	["weed_ak47_seed"] = {
		label = "AK47 Seed",
		weight = 0,
		stack = true,
		close = true,
		description = "A weed seed of AK47",
		client = {
			image = "weed_seed.png",
		}
	},

	["weed_amnesia"] = {
		label = "Amnesia 2g",
		weight = 200,
		stack = true,
		close = false,
		description = "A weed bag with 2g Amnesia",
		client = {
			image = "weed_baggy.png",
		}
	},

	["flat_muzzle_brake"] = {
		label = "Flat Muzzle Brake",
		weight = 1000,
		stack = true,
		close = true,
		description = "A muzzle brake for a weapon",
		client = {
			image = "flat_muzzle_brake.png",
		}
	},

	["comp_attachment"] = {
		label = "Compensator",
		weight = 1000,
		stack = true,
		close = true,
		description = "A compensator for a weapon",
		client = {
			image = "comp_attachment.png",
		}
	},

	["coffee"] = {
		label = "Coffee",
		weight = 200,
		stack = true,
		close = true,
		description = "Pump 4 Caffeine",
		client = {
			image = "coffee.png",
		}
	},

	["medscope_attachment"] = {
		label = "Medium Scope",
		weight = 1000,
		stack = true,
		close = true,
		description = "A medium scope for a weapon",
		client = {
			image = "medscope_attachment.png",
		}
	},

	["squared_muzzle_brake"] = {
		label = "Squared Muzzle Brake",
		weight = 1000,
		stack = true,
		close = true,
		description = "A muzzle brake for a weapon",
		client = {
			image = "squared_muzzle_brake.png",
		}
	},

	["weed_skunk"] = {
		label = "Skunk 2g",
		weight = 200,
		stack = true,
		close = false,
		description = "A weed bag with 2g Skunk",
		client = {
			image = "weed_baggy.png",
		}
	},

	["weed_whitewidow"] = {
		label = "White Widow 2g",
		weight = 200,
		stack = true,
		close = false,
		description = "A weed bag with 2g White Widow",
		client = {
			image = "weed_baggy.png",
		}
	},

	["newsbmic"] = {
		label = "Boom Microphone",
		weight = 100,
		stack = false,
		close = true,
		description = "A Useable BoomMic",
		client = {
			image = "newsbmic.png",
		}
	},

	["drum_attachment"] = {
		label = "Drum",
		weight = 1000,
		stack = true,
		close = true,
		description = "A drum for a weapon",
		client = {
			image = "drum_attachment.png",
		}
	},

	["advancedlockpick"] = {
		label = "Advanced Lockpick",
		weight = 500,
		stack = true,
		close = true,
		description = "If you lose your keys a lot this is very useful... Also useful to open your beers",
		client = {
			image = "advancedlockpick.png",
		}
	},

	["largescope_attachment"] = {
		label = "Large Scope",
		weight = 1000,
		stack = true,
		close = true,
		description = "A large scope for a weapon",
		client = {
			image = "largescope_attachment.png",
		}
	},

	["thermalscope_attachment"] = {
		label = "Thermal Scope",
		weight = 1000,
		stack = true,
		close = true,
		description = "A thermal scope for a weapon",
		client = {
			image = "thermalscope_attachment.png",
		}
	},

	["veh_turbo"] = {
		label = "Turbo",
		weight = 1000,
		stack = true,
		close = true,
		description = "Install vehicle turbo",
		client = {
			image = "veh_turbo.png",
		}
	},

	["woodcamo_attachment"] = {
		label = "Woodland Camo",
		weight = 1000,
		stack = true,
		close = true,
		description = "A woodland camo for a weapon",
		client = {
			image = "woodcamo_attachment.png",
		}
	},

	["diving_gear"] = {
		label = "Diving Gear",
		weight = 30000,
		stack = false,
		close = true,
		description = "An oxygen tank and a rebreather",
		client = {
			image = "diving_gear.png",
		}
	},

	["weed_whitewidow_seed"] = {
		label = "White Widow Seed",
		weight = 0,
		stack = true,
		close = false,
		description = "A weed seed of White Widow",
		client = {
			image = "weed_seed.png",
		}
	},

	["samsungphone"] = {
		label = "Samsung S10",
		weight = 1000,
		stack = true,
		close = true,
		description = "Very expensive phone",
		client = {
			image = "samsungphone.png",
		}
	},

	["sandwich"] = {
		label = "Sandwich",
		weight = 200,
		stack = true,
		close = true,
		description = "Nice bread for your stomach",
		client = {
			image = "sandwich.png",
		}
	},

	["barrel_attachment"] = {
		label = "Barrel",
		weight = 1000,
		stack = true,
		close = true,
		description = "A barrel for a weapon",
		client = {
			image = "barrel_attachment.png",
		}
	},

	["kurkakola"] = {
		label = "Cola",
		weight = 500,
		stack = true,
		close = true,
		description = "For all the thirsty out there",
		client = {
			image = "cola.png",
		}
	},

	["screwdriverset"] = {
		label = "Toolkit",
		weight = 1000,
		stack = true,
		close = false,
		description = "Very useful to screw... screws...",
		client = {
			image = "screwdriverset.png",
		}
	},

	["grapejuice"] = {
		label = "Grape Juice",
		weight = 200,
		stack = true,
		close = false,
		description = "Grape juice is said to be healthy",
		client = {
			image = "grapejuice.png",
		}
	},

	["steel"] = {
		label = "Steel",
		weight = 100,
		stack = true,
		close = false,
		description = "Nice piece of metal that you can probably use for something",
		client = {
			image = "steel.png",
		}
	},

	["smallscope_attachment"] = {
		label = "Small Scope",
		weight = 1000,
		stack = true,
		close = true,
		description = "A small scope for a weapon",
		client = {
			image = "smallscope_attachment.png",
		}
	},

	["cryptostick"] = {
		label = "Crypto Stick",
		weight = 200,
		stack = false,
		close = true,
		description = "Why would someone ever buy money that doesn't exist.. How many would it contain..?",
		client = {
			image = "cryptostick.png",
		}
	},

	["tactical_muzzle_brake"] = {
		label = "Tactical Muzzle Brake",
		weight = 1000,
		stack = true,
		close = true,
		description = "A muzzle brakee for a weapon",
		client = {
			image = "tactical_muzzle_brake.png",
		}
	},

	["xtcbaggy"] = {
		label = "Bag of XTC",
		weight = 0,
		stack = true,
		close = true,
		description = "Pop those pills baby",
		client = {
			image = "xtc_baggy.png",
		}
	},

	["split_end_muzzle_brake"] = {
		label = "Split End Muzzle Brake",
		weight = 1000,
		stack = true,
		close = true,
		description = "A muzzle brake for a weapon",
		client = {
			image = "split_end_muzzle_brake.png",
		}
	},

	["bank_card"] = {
		label = "Bank Card",
		weight = 0,
		stack = false,
		close = true,
		description = "Used to access ATM",
		client = {
			image = "bank_card.png",
		}
	},

	["skullcamo_attachment"] = {
		label = "Skull Camo",
		weight = 1000,
		stack = true,
		close = true,
		description = "A skull camo for a weapon",
		client = {
			image = "skullcamo_attachment.png",
		}
	},

	["pinger"] = {
		label = "Pinger",
		weight = 1000,
		stack = true,
		close = true,
		description = "With a pinger and your phone you can send out your location",
		client = {
			image = "pinger.png",
		}
	},

	["weed_ogkush_seed"] = {
		label = "OGKush Seed",
		weight = 0,
		stack = true,
		close = true,
		description = "A weed seed of OG Kush",
		client = {
			image = "weed_seed.png",
		}
	},

	["veh_suspension"] = {
		label = "Suspension",
		weight = 1000,
		stack = true,
		close = true,
		description = "Upgrade vehicle suspension",
		client = {
			image = "veh_suspension.png",
		}
	},

	["veh_wheels"] = {
		label = "Wheels",
		weight = 1000,
		stack = true,
		close = true,
		description = "Upgrade vehicle wheels",
		client = {
			image = "veh_wheels.png",
		}
	},

	["fitbit"] = {
		label = "Fitbit",
		weight = 500,
		stack = false,
		close = true,
		description = "I like fitbit",
		client = {
			image = "fitbit.png",
		}
	},

	["nvscope_attachment"] = {
		label = "Night Vision Scope",
		weight = 1000,
		stack = true,
		close = true,
		description = "A night vision scope for a weapon",
		client = {
			image = "nvscope_attachment.png",
		}
	},

	["grape"] = {
		label = "Grape",
		weight = 100,
		stack = true,
		close = false,
		description = "Mmmmh yummie, grapes",
		client = {
			image = "grape.png",
		}
	},

	["heavy_duty_muzzle_brake"] = {
		label = "HD Muzzle Brake",
		weight = 1000,
		stack = true,
		close = true,
		description = "A muzzle brake for a weapon",
		client = {
			image = "heavy_duty_muzzle_brake.png",
		}
	},

	["geocamo_attachment"] = {
		label = "Geometric Camo",
		weight = 1000,
		stack = true,
		close = true,
		description = "A geometric camo for a weapon",
		client = {
			image = "geocamo_attachment.png",
		}
	},

	["rolex"] = {
		label = "Golden Watch",
		weight = 1500,
		stack = true,
		close = true,
		description = "A golden watch seems like the jackpot to me!",
		client = {
			image = "rolex.png",
		}
	},

	["thermite"] = {
		label = "Thermite",
		weight = 1000,
		stack = true,
		close = true,
		description = "Sometimes you'd wish for everything to burn",
		client = {
			image = "thermite.png",
		}
	},

	["iphone"] = {
		label = "iPhone",
		weight = 1000,
		stack = true,
		close = true,
		description = "Very expensive phone",
		client = {
			image = "iphone.png",
		}
	},

	["holoscope_attachment"] = {
		label = "Holo Scope",
		weight = 1000,
		stack = true,
		close = true,
		description = "A holo scope for a weapon",
		client = {
			image = "holoscope_attachment.png",
		}
	},

	["aluminum"] = {
		label = "Aluminium",
		weight = 100,
		stack = true,
		close = false,
		description = "Nice piece of metal that you can probably use for something",
		client = {
			image = "aluminum.png",
		}
	},

	["heavyarmor"] = {
		label = "Heavy Armor",
		weight = 5000,
		stack = true,
		close = true,
		description = "Some protection won't hurt... right?",
		client = {
			image = "armor.png",
		}
	},

	["lawyerpass"] = {
		label = "Lawyer Pass",
		weight = 0,
		stack = false,
		close = false,
		description = "Pass exclusive to lawyers to show they can represent a suspect",
		client = {
			image = "lawyerpass.png",
		}
	},

	["tenkgoldchain"] = {
		label = "10k Gold Chain",
		weight = 2000,
		stack = true,
		close = true,
		description = "10 carat golden chain",
		client = {
			image = "10kgoldchain.png",
		}
	},

	["antipatharia_coral"] = {
		label = "Antipatharia",
		weight = 1000,
		stack = true,
		close = true,
		description = "Its also known as black corals or thorn corals",
		client = {
			image = "antipatharia_coral.png",
		}
	},

	["laptop"] = {
		label = "Laptop",
		weight = 4000,
		stack = true,
		close = true,
		description = "Expensive laptop",
		client = {
			image = "laptop.png",
		}
	},

	["printerdocument"] = {
		label = "Document",
		weight = 500,
		stack = false,
		close = true,
		description = "A nice document",
		client = {
			image = "printerdocument.png",
		}
	},

	["weed_amnesia_seed"] = {
		label = "Amnesia Seed",
		weight = 0,
		stack = true,
		close = true,
		description = "A weed seed of Amnesia",
		client = {
			image = "weed_seed.png",
		}
	},

	["grip_attachment"] = {
		label = "Grip",
		weight = 1000,
		stack = true,
		close = true,
		description = "A grip for a weapon",
		client = {
			image = "grip_attachment.png",
		}
	},

	["rubber"] = {
		label = "Rubber",
		weight = 100,
		stack = true,
		close = false,
		description = "Rubber, I believe you can make your own rubber ducky with it :D",
		client = {
			image = "rubber.png",
		}
	},

	["veh_engine"] = {
		label = "Engine",
		weight = 1000,
		stack = true,
		close = true,
		description = "Upgrade vehicle engine",
		client = {
			image = "veh_engine.png",
		}
	},

	["goldbar"] = {
		label = "Gold Bar",
		weight = 7000,
		stack = true,
		close = true,
		description = "Looks pretty expensive to me",
		client = {
			image = "goldbar.png",
		}
	},

	["harness"] = {
		label = "Race Harness",
		weight = 1000,
		stack = false,
		close = true,
		description = "Racing Harness so no matter what you stay in the car",
		client = {
			image = "harness.png",
		}
	},

	["cokebaggy"] = {
		label = "Bag of Coke",
		weight = 0,
		stack = true,
		close = true,
		description = "To get happy real quick",
		client = {
			image = "cocaine_baggy.png",
		}
	},

	-- ["glass"] = {
	-- 	label = "Glass",
	-- 	weight = 100,
	-- 	stack = true,
	-- 	close = false,
	-- 	description = "It is very fragile, watch out",
	-- 	client = {
	-- 		image = "glass.png",
	-- 	}
	-- },

	["flashlight_attachment"] = {
		label = "Flashlight",
		weight = 1000,
		stack = true,
		close = true,
		description = "A flashlight for a weapon",
		client = {
			image = "flashlight_attachment.png",
		}
	},

	["empty_weed_bag"] = {
		label = "Empty Weed Bag",
		weight = 0,
		stack = true,
		close = true,
		description = "A small empty bag",
		client = {
			image = "weed_baggy_empty.png",
		}
	},

	["veh_armor"] = {
		label = "Armor",
		weight = 1000,
		stack = true,
		close = true,
		description = "Upgrade vehicle armor",
		client = {
			image = "veh_armor.png",
		}
	},

	["beer"] = {
		label = "Beer",
		weight = 500,
		stack = true,
		close = true,
		description = "Nothing like a good cold beer!",
		client = {
			image = "beer.png",
		}
	},

	["perseuscamo_attachment"] = {
		label = "Perseus Camo",
		weight = 1000,
		stack = true,
		close = true,
		description = "A perseus camo for a weapon",
		client = {
			image = "perseuscamo_attachment.png",
		}
	},

	["tunerlaptop"] = {
		label = "Tunerchip",
		weight = 2000,
		stack = false,
		close = true,
		description = "With this tunerchip you can get your car on steroids... If you know what you're doing",
		client = {
			image = "tunerchip.png",
		}
	},

	["advancedrepairkit"] = {
		label = "Advanced Repairkit",
		weight = 4000,
		stack = true,
		close = true,
		description = "A nice toolbox with stuff to repair your vehicle",
		client = {
			image = "advancedkit.png",
		}
	},

	["digicamo_attachment"] = {
		label = "Digital Camo",
		weight = 1000,
		stack = true,
		close = true,
		description = "A digital camo for a weapon",
		client = {
			image = "digicamo_attachment.png",
		}
	},

	["armor"] = {
		label = "Armor",
		weight = 5000,
		stack = true,
		close = true,
		description = "Some protection won't hurt... right?",
		client = {
			image = "armor.png",
		}
	},

	["slanted_muzzle_brake"] = {
		label = "Slanted Muzzle Brake",
		weight = 1000,
		stack = true,
		close = true,
		description = "A muzzle brake for a weapon",
		client = {
			image = "slanted_muzzle_brake.png",
		}
	},

	["dendrogyra_coral"] = {
		label = "Dendrogyra",
		weight = 1000,
		stack = true,
		close = true,
		description = "Its also known as pillar coral",
		client = {
			image = "dendrogyra_coral.png",
		}
	},

	["bellend_muzzle_brake"] = {
		label = "Bellend Muzzle Brake",
		weight = 1000,
		stack = true,
		close = true,
		description = "A muzzle brake for a weapon",
		client = {
			image = "bellend_muzzle_brake.png",
		}
	},

	["firework1"] = {
		label = "2Brothers",
		weight = 1000,
		stack = true,
		close = true,
		description = "Fireworks",
		client = {
			image = "firework1.png",
		}
	},

	["twerks_candy"] = {
		label = "Twerks",
		weight = 100,
		stack = true,
		close = true,
		description = "Some delicious candy :O",
		client = {
			image = "twerks_candy.png",
		}
	},

	["binoculars"] = {
		label = "Binoculars",
		weight = 600,
		stack = true,
		close = true,
		description = "Sneaky Breaky...",
		client = {
			image = "binoculars.png",
		}
	},

	["veh_exterior"] = {
		label = "Exterior",
		weight = 1000,
		stack = true,
		close = true,
		description = "Upgrade vehicle exterior",
		client = {
			image = "veh_exterior.png",
		}
	},

	["casinochips"] = {
		label = "Casino Chips",
		weight = 0,
		stack = true,
		close = false,
		description = "Chips For Casino Gambling",
		client = {
			image = "casinochips.png",
		}
	},

	["firework2"] = {
		label = "Poppelers",
		weight = 1000,
		stack = true,
		close = true,
		description = "Fireworks",
		client = {
			image = "firework2.png",
		}
	},

	["veh_toolbox"] = {
		label = "Toolbox",
		weight = 1000,
		stack = true,
		close = true,
		description = "Check vehicle status",
		client = {
			image = "veh_toolbox.png",
		}
	},

	["boomcamo_attachment"] = {
		label = "Boom Camo",
		weight = 1000,
		stack = true,
		close = true,
		description = "A boom camo for a weapon",
		client = {
			image = "boomcamo_attachment.png",
		}
	},

	["leopardcamo_attachment"] = {
		label = "Leopard Camo",
		weight = 1000,
		stack = true,
		close = true,
		description = "A leopard camo for a weapon",
		client = {
			image = "leopardcamo_attachment.png",
		}
	},

	["weed_skunk_seed"] = {
		label = "Skunk Seed",
		weight = 0,
		stack = true,
		close = true,
		description = "A weed seed of Skunk",
		client = {
			image = "weed_seed.png",
		}
	},

	["fat_end_muzzle_brake"] = {
		label = "Fat End Muzzle Brake",
		weight = 1000,
		stack = true,
		close = true,
		description = "A muzzle brake for a weapon",
		client = {
			image = "fat_end_muzzle_brake.png",
		}
	},

	["aluminumoxide"] = {
		label = "Aluminium Powder",
		weight = 100,
		stack = true,
		close = false,
		description = "Some powder to mix with",
		client = {
			image = "aluminumoxide.png",
		}
	},

	["firework3"] = {
		label = "WipeOut",
		weight = 1000,
		stack = true,
		close = true,
		description = "Fireworks",
		client = {
			image = "firework3.png",
		}
	},

	["moneybag"] = {
		label = "Money Bag",
		weight = 0,
		stack = false,
		close = true,
		description = "A bag with cash",
		client = {
			image = "moneybag.png",
		}
	},

	["firstaid"] = {
		label = "First Aid",
		weight = 2500,
		stack = true,
		close = true,
		description = "You can use this First Aid kit to get people back on their feet",
		client = {
			image = "firstaid.png",
		}
	},

	["tosti"] = {
		label = "Grilled Cheese Sandwich",
		weight = 200,
		stack = true,
		close = true,
		description = "Nice to eat",
		client = {
			image = "tosti.png",
		}
	},

	["weed_ogkush"] = {
		label = "OGKush 2g",
		weight = 200,
		stack = true,
		close = false,
		description = "A weed bag with 2g OG Kush",
		client = {
			image = "weed_baggy.png",
		}
	},

	["brushcamo_attachment"] = {
		label = "Brushstroke Camo",
		weight = 1000,
		stack = true,
		close = true,
		description = "A brushstroke camo for a weapon",
		client = {
			image = "brushcamo_attachment.png",
		}
	},

	["tirerepairkit"] = {
		label = "Tire Repair Kit",
		weight = 1000,
		stack = true,
		close = true,
		description = "A kit to repair your tires",
		client = {
			image = "tirerepairkit.png",
		}
	},

	["advscope_attachment"] = {
		label = "Advanced Scope",
		weight = 1000,
		stack = true,
		close = true,
		description = "An advanced scope for a weapon",
		client = {
			image = "advscope_attachment.png",
		}
	},

	["security_card_01"] = {
		label = "Security Card A",
		weight = 0,
		stack = true,
		close = true,
		description = "A security card... I wonder what it goes to",
		client = {
			image = "security_card_01.png",
		}
	},

	["ironoxide"] = {
		label = "Iron Powder",
		weight = 100,
		stack = true,
		close = false,
		description = "Some powder to mix with.",
		client = {
			image = "ironoxide.png",
		}
	},

	["security_card_02"] = {
		label = "Security Card B",
		weight = 0,
		stack = true,
		close = true,
		description = "A security card... I wonder what it goes to",
		client = {
			image = "security_card_02.png",
		}
	},

	["coke_brick"] = {
		label = "Coke Brick",
		weight = 1000,
		stack = false,
		close = true,
		description = "Heavy package of cocaine, mostly used for deals and takes a lot of space",
		client = {
			image = "coke_brick.png",
		}
	},

	["jerry_can"] = {
		label = "Jerrycan 20L",
		weight = 20000,
		stack = true,
		close = true,
		description = "A can full of Fuel",
		client = {
			image = "jerry_can.png",
		}
	},

	["luxuryfinish_attachment"] = {
		label = "Luxury Finish",
		weight = 1000,
		stack = true,
		close = true,
		description = "A luxury finish for a weapon",
		client = {
			image = "luxuryfinish_attachment.png",
		}
	},

	["weed_nutrition"] = {
		label = "Plant Fertilizer",
		weight = 2000,
		stack = true,
		close = true,
		description = "Plant nutrition",
		client = {
			image = "weed_nutrition.png",
		}
	},

	["weed_brick"] = {
		label = "Weed Brick",
		weight = 1000,
		stack = true,
		close = true,
		description = "1KG Weed Brick to sell to large customers.",
		client = {
			image = "weed_brick.png",
		}
	},

	["sessantacamo_attachment"] = {
		label = "Sessanta Nove Camo",
		weight = 1000,
		stack = true,
		close = true,
		description = "A sessanta nove camo for a weapon",
		client = {
			image = "sessantacamo_attachment.png",
		}
	},

	["trojan_usb"] = {
		label = "Trojan USB",
		weight = 0,
		stack = true,
		close = true,
		description = "Handy software to shut down some systems",
		client = {
			image = "usb_device.png",
		}
	},

	["crack_baggy"] = {
		label = "Bag of Crack",
		weight = 0,
		stack = true,
		close = true,
		description = "To get happy faster",
		client = {
			image = "crack_baggy.png",
		}
	},

	["veh_interior"] = {
		label = "Interior",
		weight = 1000,
		stack = true,
		close = true,
		description = "Upgrade vehicle interior",
		client = {
			image = "veh_interior.png",
		}
	},

	["weed_ak47"] = {
		label = "AK47 2g",
		weight = 200,
		stack = true,
		close = false,
		description = "A weed bag with 2g AK47",
		client = {
			image = "weed_baggy.png",
		}
	},

	["veh_xenons"] = {
		label = "Xenons",
		weight = 1000,
		stack = true,
		close = true,
		description = "Upgrade vehicle xenons",
		client = {
			image = "veh_xenons.png",
		}
	},

	["walkstick"] = {
		label = "Walking Stick",
		weight = 1000,
		stack = true,
		close = true,
		description = "Walking stick for ya'll grannies out there.. HAHA",
		client = {
			image = "walkstick.png",
		}
	},

	["clip_attachment"] = {
		label = "Clip",
		weight = 1000,
		stack = true,
		close = true,
		description = "A clip for a weapon",
		client = {
			image = "clip_attachment.png",
		}
	},

	["tablet"] = {
		label = "Tablet",
		weight = 2000,
		stack = true,
		close = true,
		description = "Expensive tablet",
		client = {
			image = "tablet.png",
		}
	},

	["newscam"] = {
		label = "News Camera",
		weight = 100,
		stack = false,
		close = true,
		description = "A camera for the news",
		client = {
			image = "newscam.png",
		}
	},

	["zebracamo_attachment"] = {
		label = "Zebra Camo",
		weight = 1000,
		stack = true,
		close = true,
		description = "A zebra camo for a weapon",
		client = {
			image = "zebracamo_attachment.png",
		}
	},

	["veh_transmission"] = {
		label = "Transmission",
		weight = 1000,
		stack = true,
		close = true,
		description = "Upgrade vehicle transmission",
		client = {
			image = "veh_transmission.png",
		}
	},

	["veh_plates"] = {
		label = "Plates",
		weight = 1000,
		stack = true,
		close = true,
		description = "Install vehicle plates",
		client = {
			image = "veh_plates.png",
		}
	},

	["snikkel_candy"] = {
		label = "Snikkel",
		weight = 100,
		stack = true,
		close = true,
		description = "Some delicious candy :O",
		client = {
			image = "snikkel_candy.png",
		}
	},

	["newsmic"] = {
		label = "News Microphone",
		weight = 100,
		stack = false,
		close = true,
		description = "A microphone for the news",
		client = {
			image = "newsmic.png",
		}
	},

	["diving_fill"] = {
		label = "Diving Tube",
		weight = 3000,
		stack = false,
		close = true,
		description = "An oxygen tube and a rebreather",
		client = {
			image = "diving_tube.png",
		}
	},

	["electronickit"] = {
		label = "Electronic Kit",
		weight = 100,
		stack = true,
		close = true,
		description = "If you've always wanted to build a robot you can maybe start here. Maybe you'll be the new Elon Musk?",
		client = {
			image = "electronickit.png",
		}
	},

	["veh_tint"] = {
		label = "Tints",
		weight = 1000,
		stack = true,
		close = true,
		description = "Install vehicle tint",
		client = {
			image = "veh_tint.png",
		}
	},

	["veh_neons"] = {
		label = "Neons",
		weight = 1000,
		stack = true,
		close = true,
		description = "Upgrade vehicle neons",
		client = {
			image = "veh_neons.png",
		}
	},

	["patriotcamo_attachment"] = {
		label = "Patriot Camo",
		weight = 1000,
		stack = true,
		close = true,
		description = "A patriot camo for a weapon",
		client = {
			image = "patriotcamo_attachment.png",
		}
	},

	["labkey"] = {
		label = "Key",
		weight = 500,
		stack = false,
		close = true,
		description = "Key for a lock...?",
		client = {
			image = "labkey.png",
		}
	},
	['racingtablet'] = {
		label = 'Racing tablet',
		weight = 500,
		description = 'Seems like something to do with cars.',
		stack = false,
		client = {
			export = 'rahe-racing.racingtablet',
		}
	},
	['boostingtablet'] = {
		label = 'Boosting tablet',
		weight = 0,
		description = "Seems like something's installed on this.",
		client = {
		export = 'rahe-boosting.boostingtablet',
		}
	},
	['hackingdevice'] = {
		label = 'Hacking device',
		weight = 0,
		description = 'Will allow you to bypass vehicle security systems.',
		client = {
		export = 'rahe-boosting.hackingdevice',
		}
	},
	['gpshackingdevice'] = {
		label = 'GPS hacking device',
		weight = 0,
		description = 'If you wish to disable vehicle GPS systems.',
		client = {
		export = 'rahe-boosting.gpshackingdevice',
		}
	},
	['app_tablet'] = {
		label = 'Tablet',
		weight = 0,
		description = 'You can install different applications onto this.',
		stack = false,
		client = {
			export = 'rahe-tablet.tablet'
		}
	},
	['usb_racing'] = {
		label = 'Флашка с приложение',
		weight = 50,
		description = 'Флашка с приложение за съзтезание инсталирано на нея.',
		stack = false,
		client = {
		   export = 'rahe-tablet.usb_install'
		}
	},
	['usb_boosting'] = {
		label = 'Флашка с приложение',
		weight = 50,
		description = 'Флашка с приложение за кражба на коли инсталирано на нея.',
		stack = false,
		client = {
		   export = 'rahe-tablet.usb_install'
		}
	},

	["usbcable"] = {
		label = "USB Cable",
		weight = 20,
		stack = false,
		close = true,
		description = "Ein USB Ladekabel",
		client = {
			image = "powerbank.png",
		}
	},

	["mdtcitation"] = {
		label = "Citation",
		weight = 1000,
		stack = false,
		close = true,
		description = "Citation from a police officer!",
		client = {
			image = "citation.png",
		}
	},

	--DRC House Robbery
	
	['hack_laptop'] = {
		label = 'Hacking Laptop',
		description = "",
		weight = 20,
		stack = true
	},

	['loot_bag'] = {
		label = 'Duffle bag',
		description = "",
		weight = 50,
		stack = true
	},

	['laptop'] = {
		label = 'Laptop',
		description = "",
		weight = 100,
		stack = true
	},

	['printer'] = {
		label = 'Printer',
		description = "",
		weight = 190,
		stack = true
	},

	['npc_phone'] = {
		label = 'Phone',
		description = "",
		weight = 10,
		stack = true
	},

	['monitor'] = {
		label = 'Monitor',
		description = "",
		weight = 50,
		stack = true
	},

	['television'] = {
		label = 'TV',
		description = "",
		weight = 155,
		stack = true
	},

	['flat_television'] = {
		label = 'Flat TV',
		description = "",
		weight = 155,
		stack = true
	},

	['radio_alarm'] = {
		label = 'Radio',
		description = "",
		weight = 30,
		stack = true
	},

	['fan'] = {
		label = 'Fan',
		description = "",
		weight = 20,
		stack = true
	},

	['lockpick'] = {
		label = 'Lockpick',
		description = "Can lockpick any doors if you have enough skill!",
		weight = 165,
		stack = true
	},

	['shoebox'] = {
		label = 'Shoe box',
		description = "",
		weight = 45,
		stack = true
	},

	['dj_deck'] = {
		label = 'DJ Deck',
		description = "",
		weight = 95,
		stack = true
	},

	['console'] = {
		label = 'Console',
		description = "",
		weight = 55,
		stack = true
	},

	['boombox'] = {
		label = 'Boombox',
		description = "",
		weight = 85,
		stack = true
	},

	['bong'] = {
		label = 'Bong',
		description = "",
		weight = 25,
		stack = true
	},

	['coffemachine'] = {
		label = 'Coffe machine',
		description = "",
		weight = 55,
		stack = true
	},

	['tapeplayer'] = {
		label = 'Tape Player',
		description = "",
		weight = 55,
		stack = true
	},

	['hairdryer'] = {
		label = 'Hairdryer',
		description = "",
		weight = 55,
		stack = true
	},

	['j_phone'] = {
		label = 'Phone',
		description = "",
		weight = 55,
		stack = true
	},

	['sculpture'] = {
		label = 'Sculpture',
		description = "",
		weight = 55,
		stack = true
	},

	['toiletry'] = {
		label = 'Toiletry',
		description = "",
		weight = 10,
		stack = true
	},

	['pogo'] = {
		label = 'Art Piece',
		description = "Pogo Statue",
		weight = 155,
		stack = true
	},

	['powder'] = {
		label = 'Bag with powder',
		description = "Good for discovering lasers that are not visible",
		weight = 50,
		stack = true
	},

	['bracelet'] = {
		label = 'Bracelet',
		description = "",
		weight = 25,
		stack = true
	},

	['book'] = {
		label = 'Book',
		description = "",
		weight = 25,
		stack = true
	},

	['earings'] = {
		label = 'Earings',
		description = "",
		weight = 25,
		stack = true
	},

	['gold_bracelet'] = {
		label = 'Gold bracelet',
		description = "",
		weight = 45,
		stack = true
	},

	['gold_watch'] = {
		label = 'Gold watch',
		weight = 55,
		stack = true
	},

	['house_locator'] = {
		label = 'House locator',
		weight = 55,
		stack = true
	},

	['necklace'] = {
		label = 'Necklace',
		weight = 55,
		stack = true
	},

	['notepad'] = {
		label = 'Notepad',
		weight = 5,
		stack = true
	},

	['pencil'] = {
		label = 'Pencil',
		weight = 25,
		stack = true
	},

	['romantic_book'] = {
		label = 'Romantic book',
		weight = 25,
		stack = true
	},

	['shampoo'] = {
		label = 'Shampoo',
		weight = 25,
		stack = true
	},

	['soap'] = {
		label = 'Soap',
		weight = 25,
		stack = true
	},

	['toothpaste'] = {
		label = 'Toothpaste',
		weight = 15,
		stack = true
	},

	['watch'] = {
		label = 'Watch',
		weight = 35,
		stack = true
	},
		
	['skull'] = {
		label = 'Skull Art with diamonds',
		weight = 95,
		stack = true
	},

}