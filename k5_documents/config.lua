Config = {}

Config.Command = "documents" -- If nil, the command won't work
Config.RegisterKey = 'k' -- example: "k". If nil, there won't be a key registered. "Config.Command" has to be set to work.

Config.DocumentItemName = nil -- The name of the item you want to open the documents. If nil, no item will be registered. Example: "wallet"
Config.BirthdateFormat = "DD/MM/YYYY" -- The date format your framework uses. By default, ESX: 'DD/MM/YYYY' QB: 'YYYY-MM-DD' Check your identity/multicharacter config!

Config.PaperProp = {
  name = "prop_cd_paper_pile1",
  xRot = -130.0,
	yRot = -50.0,
	zRot = 0.0
}
-- These texts only show up on client side. To change texts in the NUI,
-- go to the web/build/config.js file
Config.Locale = {
  ["receiveNotification"] = "Получихте документ: ",
  ["giveNotification"] = "Предадохте документ: ",
  ["cancel"] = "Отказ",
  ["noPlayersAround"] = "Няма никой около вас",
  ["showDocument"] = "Покажи документ",
  ["giveCopy"] = "Дай копие",
  ["registerMapDescription"] = "Отваряне на документи"
}