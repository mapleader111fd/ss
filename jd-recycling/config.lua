Config = {
	-- **** IMPORTANT ****
	-- UseTarget should only be set to true when using qb-target
	UseTarget               = true,

	OutsideLocation         = vector4(2335.24, 4859.96, 41.0, 220.74),
	InsideLocation          = vector4(1073.0, -3102.49, -39.0, 266.61),
	DutyLocation            = vector4(1048.7, -3100.62, -40.7, 88.02),
	DropLocation            = vector4(1048.224, -3097.071, -39.5, 274.810),

	DrawPackageLocationBlip = true,

	PickupActionDuration    = math.random(4000, 6000),
	DeliveryActionDuration  = 5000,

	MaxItemsReceived        = 6,
	MinItemReceivedQty      = 2,
	MaxItemReceivedQty      = 3,
	ChanceItem              = 'usb',
	LuckyItem               = 'oldcash',

	PickupLocations         = {
		[1]  = vector4(1067.68, -3095.57, -39.9, 342.39),
		[2]  = vector4(1065.20, -3095.57, -39.9, 342.39),
		[3]  = vector4(1062.73, -3095.57, -39.9, 342.39),
		[4]  = vector4(1060.37, -3095.57, -39.9, 342.39),
		[5]  = vector4(1057.95, -3095.57, -39.9, 342.39),
		[6]  = vector4(1055.58, -3095.57, -39.9, 342.39),
		[7]  = vector4(1053.09, -3095.57, -39.9, 342.39),

		[8]  = vector4(1053.07, -3102.62, -39.9, 342.39),
		[9]  = vector4(1055.49, -3102.62, -39.9, 342.39),
		[10] = vector4(1057.93, -3102.62, -39.9, 342.39),
		[11] = vector4(1060.19, -3102.62, -39.9, 342.39),
		[12] = vector4(1062.71, -3102.62, -39.9, 342.39),
		[13] = vector4(1065.19, -3102.62, -39.9, 342.39),
		[14] = vector4(1067.46, -3102.62, -39.9, 342.39),

		[15] = vector4(1067.69, -3109.71, -39.9, 342.39),
		[16] = vector4(1065.13, -3109.71, -39.9, 342.39),
		[17] = vector4(1062.70, -3109.71, -39.9, 342.39),
		[18] = vector4(1060.24, -3109.71, -39.9, 342.39),
		[19] = vector4(1057.76, -3109.71, -39.9, 342.39),
		[20] = vector4(1055.52, -3109.71, -39.9, 342.39),
		[21] = vector4(1053.16, -3109.71, -39.9, 342.39),
	},
	WarehouseObjects        = {
		[1] = 'prop_boxpile_05a',
		[2] = 'prop_boxpile_04a',
		[3] = 'prop_boxpile_06b',
		[4] = 'prop_boxpile_02c',
		[5] = 'prop_boxpile_02b',
		[6] = 'prop_boxpile_01a',
		[7] = 'prop_boxpile_08a',
	},
	PickupBoxModel          = 'prop_cs_cardbox_01',
	ItemTable               = {
		[1] = 'iron',
		[2] = 'copper',
		[3] = 'gunpowder',
		[4] = 'plastic',
		[5] = 'metalscrap',
	}
}
