Config = {}

Config.Debug = false                     -- May print some debug messages in the console

Config.DeleteVehicleOnPlayerLeave = true -- If true, it'll delete the vehicle when the player leaves the server and has the menu open

Config.Locale = 'en'                     -- en / pt / gr (not yet) / fr (not yet) / de / es (not yet)

Config.EventPrefix = 'zashtosilosh'

Config.UISounds = true -- Enable/Disable UI Sounds

Config.Currency = {
      -- Menu Currency, Supports ISO codes only
      locale = 'en-US', -- https://www.localeplanet.com/icu/
      currency = 'USD', -- https://www.localeplanet.com/icu/currency.html
}

Config.SocietyPay = false               -- If true, it'll use the society money to pay the bills

Config.UseMoneyAccount = "bank"         -- What account to use when paying bills

Config.OpenAnywhere = false             -- If true, you can open the menu anywhere (use event 'okokTuning:openTuningMenu')
Config.AllowTuneWhenDamaged = true      -- If true, it'll allow you to tune the vehicle even if it's damaged
Config.RepairMenu = true                -- If true, it'll use the repair menu
Config.RepairCommand = 'trepair'        -- Repair command | Ace Permission: okokTuning.repair
Config.AdminCommand = 'tuning'          -- Admin command to open the menu | Ace Permission: okokTuning.admin
Config.VehicleStatsCommand = 'vehstats' -- Vehicle stats command (vehicle model, engine, transmission, etc)

Config.JobsThatCanUseRepairCommand = {  -- Jobs that can use the repair command
      'mechanic',
}

Config.QBManagement = true                 -- If set to true it will use the qb-management resource, if set to false it will use the okokBanking database tables
Config.SocietyHandler = 'qb-banking'       -- qb-management / okokBanking / qb-banking

Config.UseOkOkTextUI = false               -- If true, you need to have okokTextUI installed and configured.
Config.UseOkokNotify = false                -- If true, you need to have okokNotify installed and configured.
Config.UseOkokBanking = false               -- If true, you need to have okokBanking installed and configured.
Config.SocietyHasPrefix = false            -- If true, it'll use the society prefix for the transactions (society_job)
Config.UseOkokVehicleShop = false          -- If true, it'll use the price of the vehicles in okokVehicleShop.

Config.PricingMethod = "percentage"                               -- "fixed" = Fixed price per category | "percentage" = Percentage of the base price
Config.PricingPercentage = 0.04            -- Decimal Percentage of the Vehicles Price Impact on the Option price

Config.RepairPrice = 500.0                 -- Price to repair the vehicle
Config.RepairPriceDependsOnDamage = true   -- If true, RepairPrice will be the max price depending on the damage.

Config.ShowRecommendedInvoicePrice = true -- If true, it'll show the recommended invoice price
Config.PercentageAbovePrice = 10           -- Percentage above the price to show as recommended

Config.RemovableMods = { --[[ Remove Mods, if true, the mod will be removed from the vehicle. ]]
      BulletProofTires = true,
}

Config.OpenMenuKey = 38 -- E
Config.FreecamKey = "q"

Config.UseInspectCameras = true    -- If true, you can inspect the vehicle with the cameras
Config.CameraTransitionTime = 0.75 -- Time in seconds to change the camera

Config.InspectVehicleCameras = {
      ['cars'] = {
            { showButton = true,  bone = 'wheel_lr',      displayName = 'Left Wheel',     cameraOffset = vector3(-2.0, -1.2, 0.0), openDoors = {},             mods = { 'wheels' } },
            { showButton = true,  bone = 'window_rf',     displayName = 'Right Window',   cameraOffset = vector3(1.0, 1.0, 0.0),   openDoors = {},             mods = { 'modWindows', 'windowTint' } },
            { showButton = true,  bone = 'headlight_l',   displayName = 'Headlight',      cameraOffset = vector3(-1.0, 2.0, 0.0),  openDoors = {},             mods = { 'modArchCover', 'modAerials' } },
            { showButton = false, bone = 'wheel_lf',      displayName = 'Left Bumper',    cameraOffset = vector3(-2.0, 1.0, 1.0),  openDoors = {},             mods = { 'modFender' } },
            { showButton = false, bone = 'exhaust',       displayName = 'Exhaust',        cameraOffset = vector3(-0.5, -2.0, 0.0), openDoors = {},             mods = { 'modExhaust' } },
            { showButton = false, bone = 'windscreen_r',  displayName = 'Back Window',    cameraOffset = vector3(-1.0, -3.5, 1.5), openDoors = {},             mods = { 'modSpoilers' } },
            { showButton = false, bone = 'windscreen_r',  displayName = 'Roll Cage',      cameraOffset = vector3(0.0, 1.8, 0.0),   openDoors = {},             mods = { 'modFrame' } },
            { showButton = false, bone = 'windscreen',    displayName = 'Interior',       cameraOffset = vector3(0.2, -1.0, 0.0),  openDoors = {},             mods = { 'interior', 'dashboard', 'modDashboard' } },
            { showButton = false, bone = 'windscreen',    displayName = 'Hood',           cameraOffset = vector3(0.0, 3.0, 1.0),   openDoors = {},             mods = { 'modHood' } },
            { showButton = false, bone = 'windscreen',    displayName = 'Motor Changes',  cameraOffset = vector3(0.0, 3.0, 1.0),   openDoors = { 4 },          mods = { 'modEngineBlock', 'modAirFilter', 'modStruts' } },
            { showButton = false, bone = 'windscreen',    displayName = 'Seats',          cameraOffset = vector3(0.0, 1.0, 0.2),   openDoors = {},             mods = { 'modSeats' } },
            { showButton = false, bone = 'dials',         displayName = 'Colors',         cameraOffset = vector3(-3.0, 5.0, 2.5),  openDoors = {},             mods = { 'respray', 'PrimaryColor', 'SecondaryColor', 'pearlescent', 'modLivery' } },
            { showButton = false, bone = 'neon_l',        displayName = 'Side skirt',     cameraOffset = vector3(-2.0, -1.0, 0.3), openDoors = {},             mods = { 'modSideSkirt' } },
            { showButton = false, bone = 'neon_f',        displayName = 'Vehicle Front',  cameraOffset = vector3(0.0, 2.0, 1.0),   openDoors = {},             mods = { 'modGrille', 'FrontNeon', 'modFrontBumper', 'modXenon', 'modVanityPlate' } },
            { showButton = false, bone = 'neon_b',        displayName = 'Vehicle Back',   cameraOffset = vector3(0.0, -2.0, 1.0),  openDoors = {},             mods = { 'plateIndex', 'BackNeon', 'modRearBumper' } },
            { showButton = false, bone = 'neon_r',        displayName = 'Right Neon',     cameraOffset = vector3(2.0, 0.0, 1.0),   openDoors = {},             mods = { 'RightNeon' } },
            { showButton = false, bone = 'neon_l',        displayName = 'Left Neon',      cameraOffset = vector3(-2.0, 0.0, 1.0),  openDoors = {},             mods = { 'LeftNeon' } },
            { showButton = false, bone = 'interiorlight', displayName = 'Vehicle Roof',   cameraOffset = vector3(0.0, 2.0, 1.0),   openDoors = {},             mods = { 'modRoof', 'modTrimB', 'modTrimA' } },
            { showButton = false, bone = 'dashglow',      displayName = 'Steering wheel', cameraOffset = vector3(0.0, -0.5, -0.1), openDoors = {},             mods = { 'modSteeringWheel' } },
            { showButton = false, bone = 'door_pside_f',  displayName = 'Interior Door',  cameraOffset = vector3(-1.0, -1.0, 0.2), openDoors = { --[[ 0, 1 ]] }, mods = { 'modDoorSpeaker' } },
      },
      ['motorcycles'] = {
            { showButton = true,  bone = 'wheel_lr',    displayName = 'Rear Wheel',   cameraOffset = vector3(-2.0, -1.0, 0.0), openDoors = {}, mods = { 'backWheel', 'wheels' } },
            { showButton = true,  bone = 'wheel_lf',    displayName = 'Front Wheel',  cameraOffset = vector3(-2.0, 1.0, 0.0),  openDoors = {}, mods = { 'frontWheel' } },
            { showButton = true,  bone = 'engine',      displayName = 'Engine',       cameraOffset = vector3(-1.0, 0.5, 0.0),  openDoors = {}, mods = { 'modEngineBlock', 'modAirFilter' } },
            { showButton = false, bone = 'wheel_lf',    displayName = 'Front Bumper', cameraOffset = vector3(-1.5, 0.0, 0.5),  openDoors = {}, mods = { 'modFrontBumper' } },
            { showButton = false, bone = 'wheel_lr',    displayName = 'Rear Bumper',  cameraOffset = vector3(-1.5, 0.0, 0.5),  openDoors = {}, mods = { 'modRearBumper' } },
            { showButton = false, bone = 'engine',      displayName = 'Side Skirt',   cameraOffset = vector3(-1.5, 1.0, 0.0),  openDoors = {}, mods = { 'modSideSkirt' } },
            { showButton = false, bone = 'exhaust',     displayName = 'Exhaust',      cameraOffset = vector3(1.5, -1.0, 0.5),  openDoors = {}, mods = { 'modExhaust' } },
            { showButton = false, bone = 'taillight_r', displayName = 'Plate',        cameraOffset = vector3(0.3, -1.5, 0.0),  openDoors = {}, mods = { 'plateIndex' } },
            { showButton = false, bone = 'taillight_l', displayName = 'Plate',        cameraOffset = vector3(0.3, -1.5, 0.0),  openDoors = {}, mods = { 'plateIndex' } },
            { showButton = false, bone = 'headlight_l', displayName = 'Headlight',    cameraOffset = vector3(0.0, 2.0, 0.0),   openDoors = {}, mods = { 'modXenon' } },
            { showButton = false, bone = 'engine',      displayName = 'Colors',       cameraOffset = vector3(-3.0, 3.0, 1.5),  openDoors = {}, mods = { 'respray', 'PrimaryColor', 'SecondaryColor', 'pearlescent', 'modLivery' } },
            { showButton = false, bone = 'engine',      displayName = 'Whole Bike',   cameraOffset = vector3(-2.0, 1.0, 1.0),  openDoors = {}, mods = { 'modAerials', 'modTrimB', 'modRoof', 'modFrame', 'modHood', 'modFender', 'modRightFender', 'modTank' } },
            { showButton = false, bone = 'engine',      displayName = 'Seat',         cameraOffset = vector3(-2.0, -1.0, 1.0), openDoors = {}, mods = { 'modSeats' } },
            { showButton = false, bone = 'engine',      displayName = 'Spoilers',     cameraOffset = vector3(-2.0, 2.0, 1.0),  openDoors = {}, mods = { 'modSpoilers' } },
      }
}


--[[
      Inspect Vehicle Cameras:

      Bones: https://pastebin.com/D7JMnX1g
      Make sure you use the vehicle bones, some may not work


      List of mods:

      FrontNeon
      BackNeon
      RightNeon
      LeftNeon
      modEngine
      modBrakes
      modTransmission
      modSuspension
      modArmor
      modSpoilers
      modFrontBumper
      modRearBumper
      modSideSkirt
      modExhaust
      modFrame
      modGrille
      modHood
      modFender
      modRightFender
      modRoof
      modVanityPlate
      modTrimA
      modOrnaments
      modDashboard
      modDial
      modDoorSpeaker
      modSeats
      modSteeringWheel
      modShifterLeavers
      modAPlate
      modSpeakers
      modTrunk
      modHydrolic
      modEngineBlock
      modAirFilter
      modStruts
      modArchCover
      modAerials
      modTrimB
      modTank
      modWindows
      modLivery
      modHorns
      modFrame
      windowTint
      wheels
      plateIndex
      neons
      modXenon
      respray
      extras
      modEngine
      modBrakes
      modTransmission
      modSuspension
      modArmor
      modTurbo
      backWheel
      frontWheel
      respray           -- color
      interior          -- color
      dashboard         -- color
      pearlescent       -- color
      PrimaryColor
      SecondaryColor
      TireSmoke
      TireEnhancements
      TireDesign

]]

-- job = Only players with job (Config.JobNames) can access,
-- selfservice = Everyone can access,
Config.Zones = {
      {
            name        = "Tuning",
            jobs        = { "police" },
            coords      = vector3(539.62, -19.00, 70.63),
            size        = vector3(10, 10, 10),
            rotation    = 70,
            type        = "job",
            debug       = false,
            blipIcon    = 72,
            blipColor   = 3,
            blipDisplay = 4,
            blipScale   = 0.7,
            blipEnabled = false,
            premium     = 0, -- 0 premium price for job zones
            isFree      = true,
            hideMods    = {
                  -- ["modEngine"] = true,
                  -- ["modTransmission"] = true,
                  -- ["modSuspension"] = true,
                  -- ["modArmor"] = true,
                  -- ["modBrakes"] = true,
                  -- ["modTurbo"] = true,
            }
      },
      {
            name        = "Auto Tuning",
            coords      = vector3(-335.19, -136.57, 39.01), -- V grada
            size        = vector3(5, 5, 5),
            rotation    = 70,
            type        = "selfservice",
            debug       = false,
            blipIcon    = 72,
            blipColor   = 5,
            blipDisplay = 4,
            blipScale   = 0.7,
            blipEnabled = true,
            premium     = 100, -- 10% premium price for selfservice zones (more expensive)
            isFree      = false,
            hideMods    = {
                  ["modEngine"] = true,
                  ["modTransmission"] = true,
                  ["modSuspension"] = true,
                  ["modArmor"] = true,
                  ["modBrakes"] = true,
                  ["modTurbo"] = true,
                  ["modSpoilers"] = true,
                  ["wheels"] = true,
                  ["modWindows"] = true,
                  ["modArchCover"] = true,
                  ["modFender"] = true,
                  ["modExhaust"] = true,
                  ["modFrame"] = true,
                  ["interior"] = true,
                  ["modHood"] = true,
                  ["modGrille"] = true,
                  ["RightNeon"] = true,
                  ["LeftNeon"] = true,
                  ["modRoof"] = true,
                  ["modSteeringWheel"] = true,
                  ["modDoorSpeaker"] = true,
                  ["backWheel"] = true,
                  ["frontWheel"] = true,
                  ["modEngineBlock"] = true,
                  ["modSideSkirt"] = true,
                  ["plateIndex"] = true,
                  ["respray"] = true,
                  ["modSeats"] = true,
                  ["windowTint"] = true,
                  ["modAerials"] = true,
                  ["dashboard"] = true,
                  ["modDashboard"] = true,
                  ["modAirFilter"] = true,
                  ["modStruts	"] = true,
                  ["PrimaryColor"] = true,
                  ["SecondaryColor"] = true,
                  ["pearlescent"] = true,
                  ["modLivery"] = true,
                  ["FrontNeon"] = true,
                  ["modFrontBumper"] = true,
                  ["modXenon"] = true,
                  ["modVanityPlate"] = true,
                  ["BackNeon"] = true,
                  ["modRearBumper"] = true,
                  ["modTrimB"] = true,
                  ["modTrimA"] = true,
                  ["modRightFender"] = true,
                  ["modTank"] = true,
                  ["neons"] = true,
                  ["modHorns"] = true,                  
            }
      },
      {
            name        = "Auto Tuning",
            coords      = vector3(1175.63, 2639.92, 37.75), -- Sandi
            size        = vector3(5, 5, 5),
            rotation    = 70,
            type        = "selfservice",
            debug       = false,
            blipIcon    = 72,
            blipColor   = 5,
            blipDisplay = 4,
            blipScale   = 0.7,
            blipEnabled = true,
            premium     = 100, -- 10% premium price for selfservice zones (more expensive)
            isFree      = false,
            hideMods    = {
                  ["modEngine"] = true,
                  ["modTransmission"] = true,
                  ["modSuspension"] = true,
                  ["modArmor"] = true,
                  ["modBrakes"] = true,
                  ["modTurbo"] = true,
                  ["modSpoilers"] = true,
                  ["wheels"] = true,
                  ["modWindows"] = true,
                  ["modArchCover"] = true,
                  ["modFender"] = true,
                  ["modExhaust"] = true,
                  ["modFrame"] = true,
                  ["interior"] = true,
                  ["modHood"] = true,
                  ["modGrille"] = true,
                  ["RightNeon"] = true,
                  ["LeftNeon"] = true,
                  ["modRoof"] = true,
                  ["modSteeringWheel"] = true,
                  ["modDoorSpeaker"] = true,
                  ["backWheel"] = true,
                  ["frontWheel"] = true,
                  ["modEngineBlock"] = true,
                  ["modSideSkirt"] = true,
                  ["plateIndex"] = true,
                  ["respray"] = true,
                  ["modSeats"] = true,
                  ["windowTint"] = true,
                  ["modAerials"] = true,
                  ["dashboard"] = true,
                  ["modDashboard"] = true,
                  ["modAirFilter"] = true,
                  ["modStruts	"] = true,
                  ["PrimaryColor"] = true,
                  ["SecondaryColor"] = true,
                  ["pearlescent"] = true,
                  ["modLivery"] = true,
                  ["FrontNeon"] = true,
                  ["modFrontBumper"] = true,
                  ["modXenon"] = true,
                  ["modVanityPlate"] = true,
                  ["BackNeon"] = true,
                  ["modRearBumper"] = true,
                  ["modTrimB"] = true,
                  ["modTrimA"] = true,
                  ["modRightFender"] = true,
                  ["modTank"] = true,
                  ["neons"] = true,
                  ["modHorns"] = true,                  
            }
      },
      {
            name        = "Auto Tuning",
            coords      = vector3(110.40, 6626.26, 31.79), -- Paleto
            size        = vector3(5, 5, 5),
            rotation    = 70,
            type        = "selfservice",
            debug       = false,
            blipIcon    = 72,
            blipColor   = 5,
            blipDisplay = 4,
            blipScale   = 0.7,
            blipEnabled = true,
            premium     = 100, -- 10% premium price for selfservice zones (more expensive)
            isFree      = false,
            hideMods    = {
                  ["modEngine"] = true,
                  ["modTransmission"] = true,
                  ["modSuspension"] = true,
                  ["modArmor"] = true,
                  ["modBrakes"] = true,
                  ["modTurbo"] = true,
                  ["modSpoilers"] = true,
                  ["wheels"] = true,
                  ["modWindows"] = true,
                  ["modArchCover"] = true,
                  ["modFender"] = true,
                  ["modExhaust"] = true,
                  ["modFrame"] = true,
                  ["interior"] = true,
                  ["modHood"] = true,
                  ["modGrille"] = true,
                  ["RightNeon"] = true,
                  ["LeftNeon"] = true,
                  ["modRoof"] = true,
                  ["modSteeringWheel"] = true,
                  ["modDoorSpeaker"] = true,
                  ["backWheel"] = true,
                  ["frontWheel"] = true,
                  ["modEngineBlock"] = true,
                  ["modSideSkirt"] = true,
                  ["plateIndex"] = true,
                  ["respray"] = true,
                  ["modSeats"] = true,
                  ["windowTint"] = true,
                  ["modAerials"] = true,
                  ["dashboard"] = true,
                  ["modDashboard"] = true,
                  ["modAirFilter"] = true,
                  ["modStruts	"] = true,
                  ["PrimaryColor"] = true,
                  ["SecondaryColor"] = true,
                  ["pearlescent"] = true,
                  ["modLivery"] = true,
                  ["FrontNeon"] = true,
                  ["modFrontBumper"] = true,
                  ["modXenon"] = true,
                  ["modVanityPlate"] = true,
                  ["BackNeon"] = true,
                  ["modRearBumper"] = true,
                  ["modTrimB"] = true,
                  ["modTrimA"] = true,
                  ["modRightFender"] = true,
                  ["modTank"] = true,
                  ["neons"] = true,
                  ["modHorns"] = true,                  
            }
      },
      -- {
      --       name        = "Auto Tuning",
      --       coords      = vector3(239.73, -808.61, 30.28),
      --       size        = vector3(5, 5, 5),
      --       rotation    = 70,
      --       type        = "selfservice",
      --       debug       = false,
      --       blipIcon    = 72,
      --       blipColor   = 5,
      --       blipDisplay = 4,
      --       blipScale   = 0.7,
      --       blipEnabled = true,
      --       premium     = 10, -- 10% premium price for selfservice zones (more expensive)
      --       isFree      = false,
      --       hideMods    = {}
      -- },
      -- {
      --       name        = "Auto Tuning",
      --       coords      = vector3(-338.67, -136.94, 38.3),
      --       size        = vector3(5, 5, 5),
      --       rotation    = 70,
      --       type        = "selfservice",
      --       debug       = false,
      --       blipIcon    = 72,
      --       blipColor   = 5,
      --       blipDisplay = 4,
      --       blipScale   = 0.7,
      --       blipEnabled = true,
      --       premium     = 10,
      --       isFree      = false,
      --       hideMods    = {}
      -- },
      {
            name        = "Bennys mechanic",
            jobs        = { "mechanic" },
            coords      = vector3(144.80, -3030.09, 6.60),
            size        = vector3(20, 20, 20),
            rotation    = 70,
            type        = "job",
            debug       = false,
            blipIcon    = 72,
            blipColor   = 5,
            blipDisplay = 4,
            blipScale   = 0.7,
            blipEnabled = true,
            premium     = 10,
            isFree      = true,
            hideMods    = {}
      },
}

Config.TurboEnabled = true -- Enable or Disable Turbo mod

Config.VehicleCustomization = {
      upgrades = {
            {
                  category = Locale("EngineUpgrade"),
                  id = 11,
                  mod = "modEngine",
                  img = 'img/upgrades/engine.svg',
                  basePrice = 3000
            },
            {
                  category = Locale("TransmissionUpgrade"),
                  id = 13,
                  mod = "modTransmission",
                  img =
                  "img/upgrades/transmission.svg",
                  basePrice = 1000
            },
            {
                  category = Locale("SuspensionUpgrade"),
                  id = 15,
                  mod = "modSuspension",
                  img =
                  "img/upgrades/suspension.svg",
                  basePrice = 6000
            },
            {
                  category = Locale("BrakesUpgrade"),
                  id = 12,
                  mod = "modBrakes",
                  img = 'img/upgrades/brakes.svg',
                  basePrice = 240
            },
            {
                  category = Locale("ArmorUpgrade"),
                  id = 16,
                  mod = "modArmor",
                  img = "img/upgrades/armor.svg",
                  basePrice = 3300
            },
      },
      cosmetics = {
            {
                  category = Locale('Spoiler'),
                  id = 0,
                  mod = "modSpoilers",
                  img = 'img/cosmetics/spoiler.svg',
                  basePrice = 2000
            },
            {
                  category = Locale("FrontBumper"),
                  id = 1,
                  mod = "modFrontBumper",
                  img = 'img/cosmetics/frontbumper.svg',
                  basePrice = 2000
            },
            {
                  category = Locale("RearBumper"),
                  id = 2,
                  mod = "modRearBumper",
                  img = 'img/cosmetics/rearbumper.svg',
                  basePrice = 2000
            },
            {
                  category = Locale("SideSkirt"),
                  id = 3,
                  mod = "modSideSkirt",
                  img = 'img/cosmetics/car.svg',
                  basePrice = 2000
            },
            {
                  category = Locale("Exhaust"),
                  id = 4,
                  mod = "modExhaust",
                  img = 'img/cosmetics/exhaust.svg',
                  basePrice = 2000
            },
            {
                  category = Locale("RollCage"),
                  id = 5,
                  mod = "modFrame",
                  img = 'img/cosmetics/car.svg',
                  basePrice = 2000
            },
            {
                  category = Locale("Grille"),
                  id = 6,
                  mod = "modGrille",
                  img = 'img/cosmetics/grille.svg',
                  basePrice = 2000
            },
            {
                  category = Locale("Hood"),
                  id = 7,
                  mod = "modHood",
                  img = 'img/cosmetics/hood.svg',
                  basePrice = 2000
            },
            {
                  category = Locale("LeftFender"),
                  id = 8,
                  mod = "modFender",
                  img = 'img/cosmetics/leftfender.svg',
                  basePrice = 2000
            },
            {
                  category = Locale("RightFender"),
                  id = 9,
                  mod = "modRightFender",
                  img = 'img/cosmetics/rightfender.svg',
                  basePrice = 2000
            },
            {
                  category = Locale("Roof"),
                  id = 10,
                  mod = "modRoof",
                  img = 'img/cosmetics/car.svg',
                  basePrice = 2000
            },
            {
                  category = Locale("VanityPlates"),
                  id = 25,
                  mod = "modVanityPlate",
                  img = 'img/cosmetics/car.svg',
                  basePrice = 2000
            },
            {
                  category = Locale("TrimA"),
                  id = 27,
                  mod = "modTrimA",
                  img = 'img/cosmetics/car.svg',
                  basePrice = 2000
            },
            {
                  category = Locale("Ornaments"),
                  id = 28,
                  mod = "modOrnaments",
                  img = 'img/cosmetics/car.svg',
                  basePrice = 2000
            },
            {
                  category = Locale("Dashboard"),
                  id = 29,
                  mod = "modDashboard",
                  img = 'img/cosmetics/car.svg',
                  basePrice = 2000
            },
            {
                  category = Locale("Dial"),
                  id = 30,
                  mod = "modDial",
                  img = 'img/cosmetics/car.svg',
                  basePrice = 2000
            },
            {
                  category = Locale("DoorSpeaker"),
                  id = 31,
                  mod = "modDoorSpeaker",
                  img = 'img/cosmetics/car.svg',
                  basePrice = 2000
            },
            {
                  category = Locale("Seats"),
                  id = 32,
                  mod = "modSeats",
                  img = 'img/cosmetics/seats.svg',
                  basePrice = 2000
            },
            {
                  category = Locale("SteeringWheel"),
                  id = 33,
                  mod = "modSteeringWheel",
                  img = 'img/cosmetics/steeringwheel.svg',
                  basePrice = 2000
            },
            {
                  category = Locale("ShifterLeaver"),
                  id = 34,
                  mod = "modShifterLeavers",
                  img = 'img/cosmetics/car.svg',
                  basePrice = 2000
            },
            {
                  category = Locale("Plaque"),
                  id = 35,
                  mod = "modAPlate",
                  img = 'img/cosmetics/plate.svg',
                  basePrice = 2000
            },
            {
                  category = Locale("Speaker"),
                  id = 36,
                  mod = "modSpeakers",
                  img = 'img/cosmetics/speaker.svg',
                  basePrice = 2000
            },
            {
                  category = Locale("Trunk"),
                  id = 37,
                  mod = "modTrunk",
                  img = 'img/cosmetics/trunk.svg',
                  basePrice = 2000
            },
            {
                  category = Locale("Hydraulic"),
                  id = 38,
                  mod = "modHydrolic",
                  img = 'img/cosmetics/car.svg',
                  basePrice = 2000
            },
            {
                  category = Locale("EngineBlock"),
                  id = 39,
                  mod = "modEngineBlock",
                  img = 'img/cosmetics/car.svg',
                  basePrice = 2000
            },
            {
                  category = Locale("AirFilter"),
                  id = 40,
                  mod = "modAirFilter",
                  img = 'img/cosmetics/airfilter.svg',
                  basePrice = 2000
            },
            {
                  category = Locale("Strut"),
                  id = 41,
                  mod = "modStruts",
                  img = 'img/cosmetics/car.svg',
                  basePrice = 2000
            },
            {
                  category = Locale("ArchCover"),
                  id = 42,
                  mod = "modArchCover",
                  img = 'img/cosmetics/car.svg',
                  basePrice = 2000
            },
            {
                  category = Locale("Aerial"),
                  id = 43,
                  mod = "modAerials",
                  img = 'img/cosmetics/car.svg',
                  basePrice = 2000
            },
            {
                  category = Locale("TrimB"),
                  id = 44,
                  mod = "modTrimB",
                  img = 'img/cosmetics/car.svg',
                  basePrice = 2000
            },
            {
                  category = Locale("FuelTank"),
                  id = 45,
                  mod = "modTank",
                  img = 'img/cosmetics/car.svg',
                  basePrice = 2000
            },
            {
                  category = Locale("Window"),
                  id = 46,
                  mod = "modWindows",
                  img = 'img/cosmetics/window.svg',
                  basePrice = 2000
            },
            {
                  category = Locale("Livery"),
                  id = 48,
                  mod = "modLivery",
                  img = 'img/cosmetics/livery.svg',
                  basePrice = 2000
            },
            {
                  category = Locale("Horns"),
                  id = 14,
                  mod = "modHorns",
                  img = 'img/cosmetics/horns.svg',
                  basePrice = 300
            }
      },
}

Config.ExtraStuff = {
      Paints = {
            [0] = {
                  id = 0,
                  label = Locale('Normal'),
                  price = 1000,
            },
            [1] = {
                  id = 1,
                  label = Locale('Metallic'),
                  price = 2000,
            },
            [2] = {
                  id = 2,
                  label = Locale('Pearl'),
                  price = 2500,
            },
            [3] = {
                  id = 3,
                  label = Locale("Matte"),
                  price = 2800,
            },
            [4] = {
                  id = 4,
                  label = Locale("Metal"),
                  price = 2800,
            },
            [5] = {
                  id = 5,
                  label = Locale("Chrome"),
                  price = 8000,
            },
      },

      OtherPaints = {
            pearlescent = {
                  prices = {
                        classic = 500,
                        metallic = 500,
                        matte = 500,
                        metals = 500,
                  }
            },
            dashboard = {
                  prices = {
                        classic = 500,
                        metallic = 500,
                        matte = 500,
                        metals = 500,
                  }
            },
            interior = {
                  prices = {
                        classic = 500,
                        metallic = 500,
                        matte = 500,
                        metals = 500,
                  }
            },
            wheels = {
                  prices = {
                        classic = 500,
                        metallic = 500,
                        matte = 500,
                        metals = 500,
                  }
            },
      },

      Plates = {
            { name = Locale("BlueOnWhite1"),  id = 0, price = 150 },
            { name = Locale("BlueOnWhite2"),  id = 3, price = 150 },
            { name = Locale("BlueOnWhite3"),  id = 4, price = 150 },
            { name = Locale("YellowOnBlue"),  id = 2, price = 150 },
            { name = Locale("YellowOnBlack"), id = 1, price = 150 },
            { name = Locale("Yankton"),       id = 5, price = 150 },
      },

      WindowTintOptions = {
            { name = Locale("None"),       id = 0, price = 0 },
            { name = Locale("LightSmoke"), id = 3, price = 600 },
            { name = Locale("DarkSmoke"),  id = 2, price = 700 },
            { name = Locale("PureBlack"),  id = 1, price = 1200 },
      },

      ColorPickerPrices = {
            BodyPaint = 1000,
            Xenons = 1000,
            NeonColor = 400,
            TyreSmokeColor = 300
      },

      modTurbo = 2000,
      XenonPrice = 2000,
      NeonLightsPrice = 500,

      WheelsPrice = {
            [0] = {
                  label = Locale("Sport"),
                  price = 1000
            },
            [1] = {
                  label = Locale("Muscle"),
                  price = 1000
            },
            [2] = {
                  label = Locale("Lowrider"),
                  price = 1000
            },
            [3] = {
                  label = Locale("SUV"),
                  price = 1000
            },
            [4] = {
                  label = Locale("Offroad"),
                  price = 1000
            },
            [5] = {
                  label = Locale("Tuner"),
                  price = 1000
            },
            [6] = {
                  label = Locale("Motorcycle"),
                  price = 1000
            },
            [7] = {
                  label = Locale("Highend"),
                  price = 1000
            },
            [8] = {
                  label = Locale("BennysWheel"),
                  price = 1000
            },
            [9] = {
                  label = Locale("BespokeWheel"),
                  price = 1000
            },
            [10] = {
                  label = Locale("Dragster"),
                  price = 1000
            },
            [11] = {
                  label = Locale("Street"),
                  price = 1000
            },
            [12] = {
                  label = Locale("Rally"),
                  price = 1000
            }
      },

      CustomTiresPrice = 1000,
      BulletProofTyresPrice = 60000000,
      TyreSmokePrice = 1000,

      Extras = {
            price = 1000,
      },

      images = {
            turbo = 'img/upgrades/turbo.svg',
            respray = 'img/cosmetics/respray.svg',
            xenons = 'img/cosmetics/xenon.svg',
            extras = 'img/cosmetics/plus.svg',
            neons = 'img/cosmetics/neons.svg',
            window = 'img/cosmetics/window.svg',
            plates = 'img/cosmetics/plate.svg',
            wheels = 'img/cosmetics/tyres.svg',
      },
      RoofLiveries = {
            label = Locale('RoofLiveries'),
            basePrice = 1000,
            img = 'img/cosmetics/livery.svg',
      },
}

Config.HornPreviewDuration = 2500

Config.Horns = {
      { name = "Truck Horn",             id = 0 },
      { name = "Cop Horn",               id = 1 },
      { name = "Clown Horn",             id = 2 },
      { name = "Musical Horn 1",         id = 3 },
      { name = "Musical Horn 2",         id = 4 },
      { name = "Musical Horn 3",         id = 5 },
      { name = "Musical Horn 4",         id = 6 },
      { name = "Musical Horn 5",         id = 7 },
      { name = "Sad Trombone",           id = 8 },
      { name = "Classical Horn 1",       id = 9 },
      { name = "Classical Horn 2",       id = 10 },
      { name = "Classical Horn 3",       id = 11 },
      { name = "Classical Horn 4",       id = 12 },
      { name = "Classical Horn 5",       id = 13 },
      { name = "Classical Horn 6",       id = 14 },
      { name = "Classical Horn 7",       id = 15 },
      { name = "Scale - Do",             id = 16 },
      { name = "Scale - Re",             id = 17 },
      { name = "Scale - Mi",             id = 18 },
      { name = "Scale - Fa",             id = 19 },
      { name = "Scale - Sol",            id = 20 },
      { name = "Scale - La",             id = 21 },
      { name = "Scale - Ti",             id = 22 },
      { name = "Scale - Do",             id = 23 },
      { name = "Jazz Horn 1",            id = 24 },
      { name = "Jazz Horn 2",            id = 25 },
      { name = "Jazz Horn 3",            id = 26 },
      { name = "Jazz Horn Loop",         id = 27 },
      { name = "Star Spangled Banner 1", id = 28 },
      { name = "Star Spangled Banner 2", id = 29 },
      { name = "Star Spangled Banner 3", id = 30 },
      { name = "Star Spangled Banner 4", id = 31 },
      { name = "Classical Horn 8 Loop",  id = 32 },
      { name = "Classical Horn 9 Loop",  id = 33 },
      { name = "Classical Horn 10 Loop", id = 34 },
      { name = "Classical Horn 8",       id = 35 },
      { name = "Classical Horn 9",       id = 36 },
      { name = "Classical Horn 10",      id = 37 },
      { name = "Funeral Loop",           id = 38 },
      { name = "Funeral",                id = 39 },
      { name = "Spooky Loop",            id = 40 },
      { name = "Spooky",                 id = 41 },
      { name = "San Andreas Loop",       id = 42 },
      { name = "San Andreas",            id = 43 },
      { name = "Liberty City Loop",      id = 44 },
      { name = "Liberty City",           id = 45 },
      { name = "Festive 1 Loop",         id = 46 },
      { name = "Festive 1",              id = 47 },
      { name = "Festive 2 Loop",         id = 48 },
      { name = "Festive 2",              id = 49 },
      { name = "Festive 3 Loop",         id = 50 },
      { name = "Festive 3",              id = 51 }
}

Config.GtaColors = {
      {
            category = "classic",
            label = Locale("Classic"),
            id = 0,
            colors = {
                  { name = "Black",            id = 0 },
                  { name = "Carbon Black",     id = 147 },
                  { name = "Graphite",         id = 1 },
                  { name = "Anhracite Black",  id = 11 },
                  { name = "Black Steel",      id = 11 },
                  { name = "Dark Steel",       id = 3 },
                  { name = "Silver",           id = 4 },
                  { name = "Bluish Silver",    id = 5 },
                  { name = "Rolled Steel",     id = 6 },
                  { name = "Shadow Silver",    id = 7 },
                  { name = "Stone Silver",     id = 8 },
                  { name = "Midnight Silver",  id = 9 },
                  { name = "Cast Iron Silver", id = 10 },
                  { name = "Red",              id = 27 },
                  { name = "Torino Red",       id = 28 },
                  { name = "Formula Red",      id = 29 },
                  { name = "Lava Red",         id = 150 },
                  { name = "Blaze Red",        id = 30 },
                  { name = "Grace Red",        id = 31 },
                  { name = "Garnet Red",       id = 32 },
                  { name = "Sunset Red",       id = 33 },
                  { name = "Cabernet Red",     id = 34 },
                  { name = "Wine Red",         id = 143 },
                  { name = "Candy Red",        id = 35 },
                  { name = "Hot Pink",         id = 135 },
                  { name = "Pfsiter Pink",     id = 137 },
                  { name = "Salmon Pink",      id = 136 },
                  { name = "Sunrise Orange",   id = 36 },
                  { name = "Orange",           id = 38 },
                  { name = "Bright Orange",    id = 138 },
                  { name = "Gold",             id = 99 },
                  { name = "Bronze",           id = 90 },
                  { name = "Yellow",           id = 88 },
                  { name = "Race Yellow",      id = 89 },
                  { name = "Dew Yellow",       id = 91 },
                  { name = "Dark Green",       id = 49 },
                  { name = "Racing Green",     id = 50 },
                  { name = "Sea Green",        id = 51 },
                  { name = "Olive Green",      id = 52 },
                  { name = "Bright Green",     id = 53 },
                  { name = "Gasoline Green",   id = 54 },
                  { name = "Lime Green",       id = 92 },
                  { name = "Midnight Blue",    id = 141 },
                  { name = "Galaxy Blue",      id = 61 },
                  { name = "Dark Blue",        id = 62 },
                  { name = "Saxon Blue",       id = 63 },
                  { name = "Blue",             id = 64 },
                  { name = "Mariner Blue",     id = 65 },
                  { name = "Harbor Blue",      id = 66 },
                  { name = "Diamond Blue",     id = 67 },
                  { name = "Surf Blue",        id = 68 },
                  { name = "Nautical Blue",    id = 69 },
                  { name = "Racing Blue",      id = 73 },
                  { name = "Ultra Blue",       id = 70 },
                  { name = "Light Blue",       id = 74 },
                  { name = "Chocolate Brown",  id = 96 },
                  { name = "Bison Brown",      id = 101 },
                  { name = "Creeen Brown",     id = 95 },
                  { name = "Feltzer Brown",    id = 94 },
                  { name = "Maple Brown",      id = 97 },
                  { name = "Beechwood Brown",  id = 103 },
                  { name = "Sienna Brown",     id = 104 },
                  { name = "Saddle Brown",     id = 98 },
                  { name = "Moss Brown",       id = 100 },
                  { name = "Woodbeech Brown",  id = 102 },
                  { name = "Straw Brown",      id = 99 },
                  { name = "Sandy Brown",      id = 105 },
                  { name = "Bleached Brown",   id = 106 },
                  { name = "Schafter Purple",  id = 71 },
                  { name = "Spinnaker Purple", id = 72 },
                  { name = "Midnight Purple",  id = 142 },
                  { name = "Bright Purple",    id = 145 },
                  { name = "Cream",            id = 107 },
                  { name = "Ice White",        id = 111 },
                  { name = "Frost White",      id = 112 }
            }
      },
      {
            category = "metallic",
            label = Locale("Metallic"),
            id = 1,
            colors = { { name = "Black", id = 0 },
                  { name = "Carbon Black",     id = 147 },
                  { name = "Graphite",         id = 1 },
                  { name = "Anhracite Black",  id = 11 },
                  { name = "Black Steel",      id = 11 },
                  { name = "Dark Steel",       id = 3 },
                  { name = "Silver",           id = 4 },
                  { name = "Bluish Silver",    id = 5 },
                  { name = "Rolled Steel",     id = 6 },
                  { name = "Shadow Silver",    id = 7 },
                  { name = "Stone Silver",     id = 8 },
                  { name = "Midnight Silver",  id = 9 },
                  { name = "Cast Iron Silver", id = 10 },
                  { name = "Red",              id = 27 },
                  { name = "Torino Red",       id = 28 },
                  { name = "Formula Red",      id = 29 },
                  { name = "Lava Red",         id = 150 },
                  { name = "Blaze Red",        id = 30 },
                  { name = "Grace Red",        id = 31 },
                  { name = "Garnet Red",       id = 32 },
                  { name = "Sunset Red",       id = 33 },
                  { name = "Cabernet Red",     id = 34 },
                  { name = "Wine Red",         id = 143 },
                  { name = "Candy Red",        id = 35 },
                  { name = "Hot Pink",         id = 135 },
                  { name = "Pfsiter Pink",     id = 137 },
                  { name = "Salmon Pink",      id = 136 },
                  { name = "Sunrise Orange",   id = 36 },
                  { name = "Orange",           id = 38 },
                  { name = "Bright Orange",    id = 138 },
                  { name = "Gold",             id = 99 },
                  { name = "Bronze",           id = 90 },
                  { name = "Yellow",           id = 88 },
                  { name = "Race Yellow",      id = 89 },
                  { name = "Dew Yellow",       id = 91 },
                  { name = "Dark Green",       id = 49 },
                  { name = "Racing Green",     id = 50 },
                  { name = "Sea Green",        id = 51 },
                  { name = "Olive Green",      id = 52 },
                  { name = "Bright Green",     id = 53 },
                  { name = "Gasoline Green",   id = 54 },
                  { name = "Lime Green",       id = 92 },
                  { name = "Midnight Blue",    id = 141 },
                  { name = "Galaxy Blue",      id = 61 },
                  { name = "Dark Blue",        id = 62 },
                  { name = "Saxon Blue",       id = 63 },
                  { name = "Blue",             id = 64 },
                  { name = "Mariner Blue",     id = 65 },
                  { name = "Harbor Blue",      id = 66 },
                  { name = "Diamond Blue",     id = 67 },
                  { name = "Surf Blue",        id = 68 },
                  { name = "Nautical Blue",    id = 69 },
                  { name = "Racing Blue",      id = 73 },
                  { name = "Ultra Blue",       id = 70 },
                  { name = "Light Blue",       id = 74 },
                  { name = "Chocolate Brown",  id = 96 },
                  { name = "Bison Brown",      id = 101 },
                  { name = "Creeen Brown",     id = 95 },
                  { name = "Feltzer Brown",    id = 94 },
                  { name = "Maple Brown",      id = 97 },
                  { name = "Beechwood Brown",  id = 103 },
                  { name = "Sienna Brown",     id = 104 },
                  { name = "Saddle Brown",     id = 98 },
                  { name = "Moss Brown",       id = 100 },
                  { name = "Woodbeech Brown",  id = 102 },
                  { name = "Straw Brown",      id = 99 },
                  { name = "Sandy Brown",      id = 105 },
                  { name = "Bleached Brown",   id = 106 },
                  { name = "Schafter Purple",  id = 71 },
                  { name = "Spinnaker Purple", id = 72 },
                  { name = "Midnight Purple",  id = 142 },
                  { name = "Bright Purple",    id = 145 },
                  { name = "Cream",            id = 107 },
                  { name = "Ice White",        id = 111 },
                  { name = "Frost White",      id = 112 }
            }
      },
      {
            category = "matte",
            label = Locale("Matte"),
            id = 2,
            colors = { { name = "Black", id = 12 },
                  { name = "Gray",            id = 13 },
                  { name = "Light Gray",      id = 14 },
                  { name = "Ice White",       id = 131 },
                  { name = "Blue",            id = 83 },
                  { name = "Dark Blue",       id = 82 },
                  { name = "Midnight Blue",   id = 84 },
                  { name = "Midnight Purple", id = 149 },
                  { name = "Schafter Purple", id = 148 },
                  { name = "Red",             id = 39 },
                  { name = "Dark Red",        id = 40 },
                  { name = "Orange",          id = 41 },
                  { name = "Yellow",          id = 42 },
                  { name = "Lime Green",      id = 55 },
                  { name = "Green",           id = 128 },
                  { name = "Forest Green",    id = 151 },
                  { name = "Foliage Green",   id = 155 },
                  { name = "Olive Darb",      id = 152 },
                  { name = "Dark Earth",      id = 153 },
                  { name = "Desert Tan",      id = 154 }
            }
      },
      {
            category = "metals",
            label = Locale("Metals"),
            id = 3,
            colors = {
                  { name = "Brushed Steel",       id = 117 },
                  { name = "Brushed Black Steel", id = 118 },
                  { name = "Brushed Aluminium",   id = 119 },
                  { name = "Pure Gold",           id = 158 },
                  { name = "Brushed Gold",        id = 159 },
                  { name = "Chrome",              id = 120 }
            }
      }
}

-------------------------- DISCORD LOGS

-- To set your Discord Webhook URL go to sv_utils.lua, line 3

Config.BotName = 'JD-Mechanic'       -- Write the desired bot name

Config.ServerName = 'LegendsRP'    -- Write your server's name

Config.IconURL = 'https://media.discordapp.net/attachments/1250166512543862804/1250183327281840168/bg.png?ex=666a0374&is=6668b1f4&hm=483855a7ae3c2aa6b6364ccefab2bdbaa5225e11d47aa8c03a85f6dbf2e1ff1b&=&format=webp&quality=lossless&width=701&height=701'                 -- Insert your desired image link

Config.DateFormat = '%d/%m/%Y [%X]' -- To change the date format check this website - https://www.lua.org/pil/22.1.html

-- To change a webhook color you need to set the decimal value of a color, you can use this website to do that - https://www.mathsisfun.com/hexadecimal-decimal-colors.html

Config.WebhookColor = '65352'
