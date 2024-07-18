EXTERNAL_EVENTS_NAMES = {
    ["esx:getSharedObject"] = nil, -- This is nil because it will be found automatically, change it to your one ONLY in the case it can't be found
}

-- Data for the icon of locked/unlocked door
iconData = {
    [0] = {
        textureDict = "door_icon", -- Do not edit
        textureName = "unlocked", -- Do not edit

        x = 0.03,
        y = 0.04,
        
        color = { -- If all colors are to 255, the image will have the default color
            r = 255,
            g = 255,
            b = 255,
            a = 255,
        },
    },

    [1] = {
        textureDict = "door_icon", -- Do not edit
        textureName = "locked", -- Do not edit

        x = 0.03,
        y = 0.04,
        
        color = { -- If all colors are to 255, the image will have the default color
            r = 255,
            g = 255,
            b = 255,
            a = 255,
        },
    },
}

-- Lower = faster doors loading but worse performance
-- Higher = slower doors loading but better performance
INTERACTION_POINTS_REFRESH = 800

-- Seconds the blip of police alert will remain in the map
BLIP_TIME_AFTER_POLICE_ALERT = 40


--[[
    You can edit this function if you want to add second jobs or anything like that (editing this function is down to you)
    If you edit this, you WILL have also to edit the function in sv_integrations.lua file
]]
function isJobAllowed(allowedJobs)
    if(not allowedJobs) then return true end

    local playerJob = Framework.getPlayerJob()

    if(allowedJobs[playerJob] == true) then
        return true
    elseif(allowedJobs[playerJob]) then
        local playerJobGrade = tostring( Framework.getPlayerJobGrade() )

        return allowedJobs[playerJob] and allowedJobs[playerJob][playerJobGrade]
    else
        return false
    end
end