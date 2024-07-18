QBCore = exports["qb-core"]:GetCoreObject()

RegisterNetEvent(Config.EventPrefix..":notification")
AddEventHandler(Config.EventPrefix..":notification", function(title, text, type, time)
	if Config.UseOkokNotify then
		exports['okokNotify']:Alert(title, text, time, type)
	else
		QBCore.Functions.Notify(text, type, time)
	end
end)