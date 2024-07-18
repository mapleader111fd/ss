function addApplication(application)
    table.insert(config.applications, application)
end

exports('addApplication', function(application)
    addApplication(application)
end)

exports('tablet', function(_, slotData)
    openTablet(slotData)
end)

RegisterNetEvent('rahe-tablet:client:openTablet', function()
    openTablet()
end)

-- Support for 'RAHE Development' products (https://rahe.tebex.io/)
local supportedResources = {
    {
        id = 'rahe-racing',
        label = 'Racing',
        requireInstall = true,
        open = {
            type = 'event',
            value = 'rahe-racing:client:openTablet',
            data = {
                useThinFrame = true
            }
        },
        icon = 'racing.png'
    },
    {
        id = 'rahe-boosting',
        label = 'Boosting',
        requireInstall = true,
        open = {
            type = 'event',
            value = 'rahe-boosting:client:openTablet',
            data = {
                useThinFrame = true
            }
        },
        icon = 'boosting.png'
    },
    {
        id = 'rahe-drifting',
        label = 'Drifting',
        requireInstall = true,
        open = {
            type = 'event',
            value = 'rahe-drifting:client:openTablet',
            data = {
                useThinFrame = true
            }
        },
        icon = 'drifting.png'
    },
    {
        id = 'bls-mboosting',
        label = 'Towtruck',
        requireInstall = true,
        open = {
            type = 'event',
            value = 'bls-mboosting:client:OpenTablet',
            data = {
                useThinFrame = true
            }
        },
        icon = 'towtruck.png'
    },
    {
        id = 'kub_trucking',
        label = 'Trucking',
        requireInstall = true,
        open = {
            type = 'event',
            value = 'kub_trucking:client:openTablet',
            data = {
                useThinFrame = true
            }
        },
        icon = 'trucking.png'
    }
}

for _, resource in ipairs(supportedResources) do
    if GetResourceState(resource.id) ~= "missing" then
        addApplication(resource)
    end
end
