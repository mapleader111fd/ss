Config, Locales = {}, {}

Config.Locale = 'en' -- Choose the language of the script (en)

Config.EventPrefix = 'okokContract' -- The event prefix that will be used on the script

Config.okokVehicleSalesEventPrefix = "okokVehicleSales" -- okokVehicleSales event prefix (if you are using okokVehicleSales)

Config.RemoveContractAfterUse = true -- Choose if you want to keep the item after the player uses it

Config.RemoveMoneyOnSign = true -- Set if you want the script to automatically remove the money from the buyer's bank account and deposit it into the seller's account when the buyer signs it

Config.Currency = '€' -- The currency used on the script

Config.CurrencyOnLeft = false -- true = The currency symbol will be in the left side | false = On the right side on UI

Config.Item = 'contract' -- The item that will be used to sign the contract

Config.DateFormat = '%d-%m-%Y' -- (Date that appears in the contract interface) To change the date format check this website - https://www.lua.org/pil/22.1.html

Config.BlacklistedVehicles = { -- All the vehicles that are not allowed to be sold (check the gameName on vehicles.meta -> <gameName>Supra</gameName>)
	'T20',
}

Config.ContractDistance = 3.0 -- The distance that the player needs to be near the vehicle to open the contract interface

Config.UseOkokNotify = false -- If true okokNotify will be used instead of QBCore.Functions.Notify

Config.UseOkokRequests = false -- If true okokRequests will popup before opening the contract interface

Config.UseOkokBankingTransactions = false -- If true a transaction will be registered in okokBanking

-------------------------- DISCORD LOGS

-- To set your Discord Webhook URL go to server.lua, line 5

Config.BotName = 'okokContract Logs' -- Write the desired bot name

Config.ServerName = 'Legends Logs' -- Write your server's name

Config.IconURL = '' -- Insert your desired image link

Config.WebhookDateFormat = '%d/%m/%Y [%X]' -- To change the date format check this website - https://www.lua.org/pil/22.1.html

-- To change a webhook color you need to set the decimal value of a color, you can use this website to do that - https://www.mathsisfun.com/hexadecimal-decimal-colors.html45518a

Config.sellVehicleWebhookColor = '65352'

-------------------------- LOCALES (DON'T TOUCH)
	
function _okok(id)
	if Locales[Config.Locale][id] then
		return Locales[Config.Locale][id]
	else
		print("The locale '"..id.."' doesn't exist!")
	end
end