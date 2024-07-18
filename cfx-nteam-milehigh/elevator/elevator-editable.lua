Config = {}

Config.EnableElevator = true
Config.Debug = false


Config.Type = "ox_taget" -- target | point  (target = ox_target | point = ox_lib points)


-- Ox_lib points --
Config.DrawMarker = true  -- ox_lib points only
Config.Distance = 2
Config.Marker = 2
Config.MarkerSize = { x = 0.3, y = 0.3, z = 0.3 }

Config.EnterKey = 38 -- E (only ox_lib point)

-- Ox_Target --
Config.TargetIcon = "fas fa-desktop" -- https://fontawesome.com/search



Config.Text = {
	['elevator'] = 'Elevator',
	['lobby'] = 'Lobby',
	['use_elevator'] = '[E] - To use Elevator',
	['wrong_pin'] = 'Wrong PIN',

	['app_one'] = 'Appartment I',
	['app_two'] = 'Appartment II',
	['app_one_desc'] = 'On Sale | PIN: 0000',
	['app_two_desc'] = 'On Sale | PIN: 0000',

	['off_one'] = 'Office I',
	['off_one_desc'] = 'On Sale',
	['off_two'] = 'Office II',
	['off_two_desc'] = 'On Sale',
}


Config.AppartmentLobby = { x = -165.4616, y = -991.3012, z = 29.5126 }
Config.AppartmentIcon = "home"

Config.AppartmentOne = { x = -151.4349, y = -954.3071, z = 239.2305 }
Config.AppartmentOnePIN = "0000"

Config.AppartmentTwo = { x = -160.5766, y = -994.4111, z = 252.4352 }
Config.AppartmentTwoPIN = "0000"


Config.SpaLobby = { x = -163.9335, y = -987.6642, z = 29.5126 }

Config.SpaLoc = { x = -146.7868, y = -990.8665, z = 189.1334 }


Config.OfficeLobby = { x = -162.6670, y = -983.8533, z = 29.5126 }
Config.OfficeIcon = "building"

Config.OfficeOne = { x = -153.6317, y = -963.6077, z = 227.0400 }

Config.OfficeTwo = { x = -153.1949, y = -979.0076,z = 219.8272 }




-- You can add here checks you want. For Example: Did player bought ticket for spad
--                                                Does he has VIP 
--                                                ETC...

AddEventHandler("ndev_elevator:enterSpa", function()
	local pid = cache.ped
	SetEntityCoords(pid, Config.SpaLoc.x, Config.SpaLoc.y, Config.SpaLoc.z, false, false, false, true)
end)


-- Here you can make checks for jobs or smth like that
AddEventHandler("ndev_elevator:enterOfficeOne", function()
	local pid = cache.ped
	SetEntityCoords(pid, Config.OfficeOne.x, Config.OfficeOne.y, Config.OfficeOne.z, false, false, false, true)
end)

AddEventHandler("ndev_elevator:enterOfficeTwo", function()
	local pid = cache.ped
	SetEntityCoords(pid, Config.OfficeTwo.x, Config.OfficeTwo.y, Config.OfficeTwo.z, false, false, false, true)
end)



-- In case you want use custom TextUI/Notify
-- Remember if you want to use ESX/QB or and other Framework dependable notifications
-- You have to import it in fxmanifest or use an export (ESX/QBCore/QBX/...)

function ShowTextUI(msg)

	lib.showTextUI(msg)
end

function HideTextUI()

	lib.hideTextUI()
end

function SendTextMessage(msg)

	--SetNotificationTextEntry('STRING')
	--AddTextComponentString(msg)
	--DrawNotification(0,1)

	--exports['okokNotify']:Alert('ADMIN PANEL', msg, 5000, 'info')
	--exports['mythic_notify']:SendAlert('inform', msg)
	--ESX.ShowNotification(msg)
	
	lib.notify({
		title = 'Info',
		description = msg,
		type = 'info'
	})
end