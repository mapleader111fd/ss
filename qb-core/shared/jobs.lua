QBShared = QBShared or {}
QBShared.ForceJobDefaultDutyAtLogin = true -- true: Force duty state to jobdefaultDuty | false: set duty state from database last saved
QBShared.Jobs = {
	unemployed = { label = 'Civilian', defaultDuty = true, offDutyPay = false, grades = { ['0'] = { name = 'Freelancer', payment = 10 } } },
	bus = { label = 'Bus', defaultDuty = true, offDutyPay = false, grades = { ['0'] = { name = 'Driver', payment = 50 } } },
	-- judge = { label = 'Honorary', defaultDuty = true, offDutyPay = false, grades = { ['0'] = { name = 'Judge', payment = 100 } } },
	lawyer = { label = 'Law Firm', defaultDuty = true, offDutyPay = false, grades = { ['0'] = { name = 'Associate', payment = 50 } } },
	reporter = { label = 'Reporter', defaultDuty = true, offDutyPay = false, grades = { ['0'] = { name = 'Journalist', payment = 50 } } },
	trucker = { label = 'Trucker', defaultDuty = true, offDutyPay = false, grades = { ['0'] = { name = 'Driver', payment = 50 } } },
	tow = { label = 'Towing', defaultDuty = true, offDutyPay = false, grades = { ['0'] = { name = 'Driver', payment = 50 } } },
	garbage = { label = 'Garbage', defaultDuty = true, offDutyPay = false, grades = { ['0'] = { name = 'Collector', payment = 50 } } },
	vineyard = { label = 'Vineyard', defaultDuty = true, offDutyPay = false, grades = { ['0'] = { name = 'Picker', payment = 50 } } },
	hotdog = { label = 'Hotdog', defaultDuty = true, offDutyPay = false, grades = { ['0'] = { name = 'Sales', payment = 50 } } },

	police = {
		label = 'Law Enforcement',
		type = 'leo',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Cadet', payment = 980 },
			['1'] = { name = 'Solo-Cadet', payment = 1150 },
			['2'] = { name = 'Officer', payment = 1330 },
			['3'] = { name = 'Senior Officer', payment = 1420 },
			['4'] = { name = 'Corporal', payment = 1600 },
			['5'] = { name = 'Seargeant', payment = 1720 },
			['6'] = { name = 'Lieutenant', payment = 1800 },
			['7'] = { name = 'Captain', payment = 1920 },
			['8'] = { name = 'Assistant Chief', payment = 2000 },
			['9'] = { name = 'Chief of Police',  isboss = true, payment = 2200 },
		},
	},
	ambulance = {
		label = 'EMS',
		type = 'ems',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Recruit', payment = 1150 },
			['1'] = { name = 'Paramedic', payment = 1420 },
			['2'] = { name = 'Doctor', payment = 1600 },
			['3'] = { name = 'Surgeon', payment = 1720 },
			['4'] = { name = 'Chief', isboss = true, payment = 1800 },
		},
	},
	mechanic = {
		label = 'LS Customs',
		type = 'mechanic',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Recruit', payment = 550 },
			['1'] = { name = 'Novice', payment = 740 },
			['2'] = { name = 'Experienced', payment = 800 },
			['3'] = { name = 'Advanced', payment = 1000 },
			['4'] = { name = 'Manager', isboss = true, payment = 1200 },
		},
	},
	doj = {
		label = 'DOJ',
		type = 'doj',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Clerk', payment = 650 },
			['1'] = { name = 'Данъчен', payment = 850 },
			['2'] = { name = 'Специален агент', payment = 1000 },
			['3'] = { name = 'Прокурор', payment = 1200 },
			['4'] = { name = 'Федерален прокурор', payment = 1400 },
			['5'] = { name = 'Съдия', payment = 1600 },
			['6'] = { name = 'Върховен съдия', isboss = true, payment = 1700 },
		},
	},
	advokat = {
		label = 'Адокати',
		type = 'advokat',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Мл. Адвокат', payment = 700 },
			['1'] = { name = 'Адвокат', payment = 800 },
			['2'] = { name = 'Ст. Адвокат', payment = 1000 },
			['3'] = { name = 'Председател на АК', isboss = true, payment = 1200 },
		},
	},
	galaxybar = {
		label = 'Galaxy Bar',
		type = 'galaxybar',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Барман', payment = 550 },
			['1'] = { name = 'Dj', payment = 740 },
			['2'] = { name = 'Manager', payment = 800 },
			['3'] = { name = 'Boss', isboss = true, payment = 1200 },
		},
	},
	['beanmachine'] = {
        label = 'Bean Machine',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 700
            },
            ['1'] = {
                name = 'Novice',
                payment = 920
            },
            ['2'] = {
                name = 'Experienced',
                payment = 1180
            },
            ['3'] = {
                name = 'Advanced',
                payment = 1300
            },
            ['4'] = {
                name = 'Manager',
                payment = 1400
            },
            ['5'] = {
                name = 'Boss',
                isboss = true,
                payment = 1500
            },
        },
    },
	realestate = {
		label = 'Real Estate',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Recruit', payment = 50 },
			['1'] = { name = 'House Sales', payment = 75 },
			['2'] = { name = 'Business Sales', payment = 100 },
			['3'] = { name = 'Broker', payment = 125 },
			['4'] = { name = 'Manager', isboss = true, payment = 150 },
		},
	},
	townhall = {
		label = 'Townhall',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Адвокат', payment = 1700 },
			['1'] = { name = 'Нотариус', payment = 2150 },
			['2'] = { name = 'Съдия', payment = 2500 },
			['3'] = { name = 'Прокурор', payment = 2700 },
			['4'] = { name = 'Кмет', isboss = true, payment = 3100 },
		},
	},
}