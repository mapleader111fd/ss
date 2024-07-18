Koci           = {}
Koci.Framework = Utils.Functions:GetFramework()
Koci.Utils     = Utils.Functions
Koci.Callbacks = {}
Koci.Client    = {
    PlayerData = {},
    HUD        = {
        data = {
            isVisible = true,
            bars = {
                voice = {
                    microphone = false,
                    radio = false,
                    isTalking = false,
                    range = 1,
                },
                health = nil,
                armor = nil,
                hunger = nil,
                thirst = nil,
                oxygen = nil,
                stamina = nil,
                stress = nil,
                terminal = nil,
                leaf = nil,
            },
            vehicle = {
                thick = {
                    wait = 200
                },
                entity = nil,
                kmH = Config.Settings.VehicleHUD.kmH,
                show = false,
                isSeatbeltOn = false,
                isPassenger = false,
                cruiseControlStatus = nil,
                inVehicle = false,
                speed = 0,
                _lastEntitySpeed = 0,
                _lastBodyHealth = 1000,
                engineHealth = 1000,
                fuel = {
                    level = 0,
                    max_level = 0,
                    type = nil,
                },
                rpm = 0,
                gear = nil,
                miniMap = {
                    alwaysActive = false,
                    style = "square"
                },
                speedoMeter = {
                    fps = nil
                },
                type = 2,
                lightsOn = false,
                manualMode = false,
                manualGear = "N",
                previousVelocity = vector3(0, 0, 0),
            },
            compass = {
                onlyInVehicle = false,
                show = false,
                heading = 0,
                lastCrossRoadCheck = -1,
                crossRoad = {
                    street1 = nil,
                    street2 = nil
                },
            },
            account = {
                playerServerId = -1,
                playerBalance = {
                    cash = 0,
                    bank = 0,
                }
            },
            isCinematicHudActive = false,
        },
    }
}
