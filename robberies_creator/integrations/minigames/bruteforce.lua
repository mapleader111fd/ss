local MAX_ATTEMPTS = { -- The numbers on the left, are the difficulty, the ones on the right, are the attempts
    [1] = 7,
    [2] = 5,
    [3] = 3,
    [4] = 2,
    [5] = 1,
}
local codes = {
    "(JAKSAM)",
    "SHIRONR1",
    "MEDICINE",
    "OFFSHORE",
    "RESERVED",
    "CRIMINAL",
    "NARCOTIC",
    "SEDATIVE",
    "CHEMICAL",
    "MORPHINE",
}

local function setLabels(scaleform, state) -- State: 1 = hackconnect.exe to do, 2 = bruteforce.exe to do
    BeginScaleformMovieMethod(scaleform, "SET_LABELS")
    ScaleformMovieMethodAddParamTextureNameString(getLocalizedText("bruteforce:local_disk"))
    ScaleformMovieMethodAddParamTextureNameString(getLocalizedText("bruteforce:network"))
    ScaleformMovieMethodAddParamTextureNameString(getLocalizedText("bruteforce:usb_drive"))

    if(state == 1) then
        ScaleformMovieMethodAddParamTextureNameString("~g~HackConnect.exe~s~")
        ScaleformMovieMethodAddParamTextureNameString("~r~BruteForce.exe~s~")    
    elseif(state == 2) then
        ScaleformMovieMethodAddParamTextureNameString("~r~HackConnect.exe~s~")
        ScaleformMovieMethodAddParamTextureNameString("~g~BruteForce.exe~s~")    
    end

    EndScaleformMovieMethod()
end

local function setColumnsSpeed(scaleform)
    for column=0, 7 do
        BeginScaleformMovieMethod(scaleform, "SET_COLUMN_SPEED")
        ScaleformMovieMethodAddParamInt(column)
        ScaleformMovieMethodAddParamInt(math.random(-50, 255))
        EndScaleformMovieMethod()
    end
end

local function loadScaleform(scaleformName)
    local scaleform = RequestScaleformMovieInteractive(scaleformName)

    while not HasScaleformMovieLoaded(scaleform) do
        Citizen.Wait(0)
    end

    setLabels(scaleform, 1)

    BeginScaleformMovieMethod(scaleform, "SET_BACKGROUND") -- Backgrounds from 0 to 6
    ScaleformMovieMethodAddParamInt(1)
    EndScaleformMovieMethod()

    BeginScaleformMovieMethod(scaleform, "ADD_PROGRAM")
    ScaleformMovieMethodAddParamFloat(1.0)
    ScaleformMovieMethodAddParamFloat(4.0)
    ScaleformMovieMethodAddParamTextureNameString(getLocalizedText("bruteforce:my_computer"))
    EndScaleformMovieMethod()

    BeginScaleformMovieMethod(scaleform, "ADD_PROGRAM")
    ScaleformMovieMethodAddParamFloat(2.0)
    ScaleformMovieMethodAddParamFloat(6.0)
    ScaleformMovieMethodAddParamTextureNameString(getLocalizedText("bruteforce:power_off"))
    EndScaleformMovieMethod()

    return scaleform
end

local function getCorrectCode()
    return codes[math.random(1, #codes)]
end

local function computerLoading(scaleform, message, duration) -- Duration in ms
    local maxSteps = 10
    local interval = duration / maxSteps

    BeginScaleformMovieMethod(scaleform, "SET_LOADING_MESSAGE")
    ScaleformMovieMethodAddParamTextureNameString(message)
    ScaleformMovieMethodAddParamFloat(2.0)
    EndScaleformMovieMethod()

    for i=1, maxSteps do
        BeginScaleformMovieMethod(scaleform, "SET_LOADING_PROGRESS")
        ScaleformMovieMethodAddParamInt(i * 10)
        EndScaleformMovieMethod()

        local loadingTime = math.ceil((interval * maxSteps - (i*interval)) / 1000)

        if(loadingTime <= 0) then
            loadingTime = 1
        end

        BeginScaleformMovieMethod(scaleform, "SET_LOADING_TIME")
        ScaleformMovieMethodAddParamInt(loadingTime)
        EndScaleformMovieMethod()    

        Citizen.Wait(interval)
    end
end

local function finalHackConnectMessage(scaleform, message)
    BeginScaleformMovieMethod(scaleform, "SET_IP_OUTCOME")
    ScaleformMovieMethodAddParamBool(true)
    ScaleformMovieMethodAddParamTextureNameString(message)
    EndScaleformMovieMethod()
end

local function setAttempts(scaleform, remainingAttempts, difficulty)
    BeginScaleformMovieMethod(scaleform, "SET_LIVES")
    ScaleformMovieMethodAddParamInt(remainingAttempts)
    ScaleformMovieMethodAddParamInt(MAX_ATTEMPTS[difficulty])
    EndScaleformMovieMethod()
end

local function disableKeys()
    DisableAllControlActions(0)
    EnableControlAction(0, 239, true) -- Mouse movement
    EnableControlAction(0, 240, true) -- Mouse movement
end

function bruteforceMinigame(difficulty)
    local attempts = MAX_ATTEMPTS[difficulty]
    local plyPed = PlayerPedId()
    local scaleform = loadScaleform("HACKING_PC")

    local methodReturn = nil

    local hasFinishedHackConnect = false
    local hasFinishedBruteForce = false
    local isCurrentlyDoingMinigame = false

    local running = true

    Citizen.CreateThread(function() 
        FreezeEntityPosition(plyPed, true)

        while running do
            Citizen.Wait(0)

            DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255, 0)
            BeginScaleformMovieMethod(scaleform, "SET_CURSOR")
            ScaleformMovieMethodAddParamFloat( GetControlNormal(0, 239) ) 
            ScaleformMovieMethodAddParamFloat( GetControlNormal(0, 240) )
            EndScaleformMovieMethod()

            if IsDisabledControlJustPressed(0,24) or IsDisabledControlJustPressed(0, 176) then -- Left mouse
                BeginScaleformMovieMethod(scaleform, "SET_INPUT_EVENT_SELECT")
                methodReturn = PopScaleformMovieFunction()
                PlaySoundFrontend(-1, "HACKING_CLICK", "", true)
            elseif IsDisabledControlJustPressed(0, 25) and not isCurrentlyDoingMinigame then -- Right mouse
                BeginScaleformMovieMethod(scaleform, "SET_INPUT_EVENT_BACK")
                EndScaleformMovieMethod()
                PlaySoundFrontend(-1, "HACKING_CLICK", "", true)
            elseif IsDisabledControlJustPressed(0, 172) and not hasFinishedHackConnect then
                BeginScaleformMovieMethod(scaleform, "SET_INPUT_EVENT")
                PushScaleformMovieFunctionParameterInt(8)
                PlaySoundFrontend(-1, "HACKING_CLICK", "", true)
            elseif IsDisabledControlJustPressed(0, 173) and not hasFinishedHackConnect then
                BeginScaleformMovieMethod(scaleform, "SET_INPUT_EVENT")
                PushScaleformMovieFunctionParameterInt(9)
                PlaySoundFrontend(-1, "HACKING_CLICK", "", true)
            elseif IsDisabledControlJustPressed(0, 174) and not hasFinishedHackConnect then
                BeginScaleformMovieMethod(scaleform, "SET_INPUT_EVENT")
                PushScaleformMovieFunctionParameterInt(10)
                PlaySoundFrontend(-1, "HACKING_CLICK", "", true)
            elseif IsDisabledControlJustPressed(0, 175) and not hasFinishedHackConnect then
                BeginScaleformMovieMethod(scaleform, "SET_INPUT_EVENT")
                PushScaleformMovieFunctionParameterInt(11)
                PlaySoundFrontend(-1, "HACKING_CLICK", "", true)
            end

            disableKeys()
        end

        FreezeEntityPosition(plyPed, false)
    end)

    setAttempts(scaleform, attempts, difficulty)

    local correctCode = getCorrectCode()

    while running do
        Citizen.Wait(0)

        if IsScaleformMovieMethodReturnValueReady(methodReturn) then 
            local app = GetScaleformMovieMethodReturnValueInt(methodReturn)

            if(app == 82 and not hasFinishedHackConnect) then -- HackConnect.exe app
                setAttempts(scaleform, attempts, difficulty)

                BeginScaleformMovieMethod(scaleform, "OPEN_APP")
                ScaleformMovieMethodAddParamFloat(0.0)
                EndScaleformMovieMethod()

                isCurrentlyDoingMinigame = true
            elseif(app == 85) then -- HackConnect.exe error
                PlaySoundFrontend(-1, "HACKING_FAILURE", "", false)
                BeginScaleformMovieMethod(scaleform, "CLOSE_APP")
                EndScaleformMovieMethod()

                isCurrentlyDoingMinigame = false
            elseif(app == 84) then -- HackConnect.exe success
                hasFinishedHackConnect = true

                PlaySoundFrontend(-1, "HACKING_SUCCESS", "", true)

                finalHackConnectMessage(scaleform, getLocalizedText("hackconnect:ip_spoofed"))

                setLabels(scaleform, 2)

                Citizen.Wait(2000)

                finalHackConnectMessage(scaleform, getLocalizedText("hackconnect:use_bruteforce"))

                Citizen.Wait(2000)
                
                BeginScaleformMovieMethod(scaleform, "CLOSE_APP")
                EndScaleformMovieMethod()    

                -- Closes "my computer" stuff (to refresh the labels)
                for i=1, 2 do
                    BeginScaleformMovieMethod(scaleform, "SET_INPUT_EVENT_BACK")
                    EndScaleformMovieMethod()    
                end

                isCurrentlyDoingMinigame = false
            elseif(app == 83 and hasFinishedHackConnect) then -- bruteforce.exe app
                Citizen.CreateThread(function() 
                    while (not hasFinishedBruteForce) and running do
                        Citizen.Wait(math.random(0, 1000))
                        setColumnsSpeed(scaleform)
                    end
                end)

                BeginScaleformMovieMethod(scaleform, "RUN_PROGRAM")
                ScaleformMovieMethodAddParamFloat(83.0)
                EndScaleformMovieMethod()

                BeginScaleformMovieMethod(scaleform, "SET_ROULETTE_WORD")
                ScaleformMovieMethodAddParamTextureNameString(correctCode)
                EndScaleformMovieMethod()

                isCurrentlyDoingMinigame = true
            elseif(app == 87) then -- bruteforce.exe error
                attempts = attempts - 1

                PlaySoundFrontend(-1, "HACKING_CLICK_BAD", "", false)
                setAttempts(scaleform, attempts, difficulty)
            elseif(app == 92) then -- bruteforce.exe success
                PlaySoundFrontend(-1, "HACKING_CLICK_GOOD", "", false)
            elseif(app == 86) then -- bruteforce.exe completed
                hasFinishedBruteForce = true
                PlaySoundFrontend(-1, "HACKING_SUCCESS", "", true)
                
                BeginScaleformMovieMethod(scaleform, "SET_ROULETTE_OUTCOME")
                ScaleformMovieMethodAddParamBool(true)
                ScaleformMovieMethodAddParamTextureNameString(getLocalizedText("bruteforce:bruteforce_succesful"))
                EndScaleformMovieMethod()
                
                Citizen.Wait(1500)

                BeginScaleformMovieMethod(scaleform, "CLOSE_APP")
                EndScaleformMovieMethod()
                
                BeginScaleformMovieMethod(scaleform, "OPEN_LOADING_PROGRESS")
                ScaleformMovieMethodAddParamBool(true)
                EndScaleformMovieMethod()
                
                computerLoading(scaleform, getLocalizedText("bruteforce:accessing_computer_system"), 3000)

                computerLoading(scaleform, getLocalizedText("bruteforce:injecting_virus"), 3000)

                BeginScaleformMovieMethod(scaleform, "OPEN_LOADING_PROGRESS")
                ScaleformMovieMethodAddParamBool(false)
                EndScaleformMovieMethod()
                
                Citizen.Wait(1000)

                SetScaleformMovieAsNoLongerNeeded(scaleform)

                running = false

                isCurrentlyDoingMinigame = false

                return true
            elseif(app == 6) then -- Close
                Citizen.Wait(500)
                running = false
            end

            if(attempts == 0) then
                hasFinishedBruteForce = true
                
                PlaySoundFrontend(-1, "HACKING_FAILURE", "", true)
                BeginScaleformMovieMethod(scaleform, "SET_ROULETTE_OUTCOME")
                ScaleformMovieMethodAddParamBool(false)
                ScaleformMovieMethodAddParamTextureNameString(getLocalizedText("bruteforce:bruteforce_failed"))
                EndScaleformMovieMethod()
                
                Citizen.Wait(3500)
                BeginScaleformMovieMethod(scaleform, "CLOSE_APP")
                EndScaleformMovieMethod()
                
                BeginScaleformMovieMethod(scaleform, "OPEN_ERROR_POPUP")
                ScaleformMovieMethodAddParamBool(true)
                ScaleformMovieMethodAddParamTextureNameString(getLocalizedText("bruteforce:malicious_software_detected"))
                EndScaleformMovieMethod()
                
                Citizen.Wait(2500)
                SetScaleformMovieAsNoLongerNeeded(scaleform)
                EndScaleformMovieMethod()

                running = false
            end
        end
    end
    
    return false
end