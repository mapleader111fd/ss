Slots = {}

-- Add the user's rockstar license or license2: and how many slots they want to have in total
-- If you are using Qbox, change license:xxxxx to license2:xxxxx

-- @ If Slots.DiscordPerm.status is false | for manuel license works
-- This does not include Config.DefaultSlots, it sets the direct slot limit of the character

Slots.List = {
    -- {license = "license:265facbedf57f50864eab3dea28ed9d537c1ada0", totalSlot = 2}, -- Gabi
    -- {license = "license:cb6386535a7c60f1b2131e4439620b5a437b9c9b", totalSlot = 2}, -- Jenata na boris
    {license = "license:b155d45c17c0214effd763cf9f4ed4ad057d17c9", totalSlot = 2}, -- Boris
    {license = "license:0d7672744ab9ad6a8979551d8037a64d93a20276", totalSlot = 5}, -- Jabata
    {license = "license:0a0b10f88713edea3aa90994a8c82ef8f028b7d5", totalSlot = 2}, -- FlexA discord:992532112261513256
    {license = "license:f1e659be4bb4c40354a66ffda28c6be49054a8d8", totalSlot = 2}, -- Ka6on
    {license = "license:480f8e95a3d27c1a4a62ed084a1ca6865218e6f6", totalSlot = 2}, -- RV
    {license = "license:70cce51a44a05785f79daa825c5365cd35ae7070", totalSlot = 2}, -- Mason-a
    {license = "license: 23b56c1b870a0cf56fccb3528aadba0663be2d7b", totalSlot = 2}, -- Bobings
    {license = "license:65aec3a32bcec9d936df1fb11ae6d99544ed750d", totalSlot = 2}, -- droxy
    {license = "license:974286f37c4f8b344a96a679eaefb9b8b1878e1f", totalSlot = 2}, -- Monkey-to
    {license = "license:006ae5b01546251cced7efea145715074844ba4f", totalSlot = 2}, -- Rusnaka
    {license = "license:c6acb22b187265ee8ab46a4090eaa097772c89d1", totalSlot = 2}, -- Hokedj
    {license = "license:388b8e514e24cbf684d2e63ffb053b7000b0f6c1", totalSlot = 2}, -- Rusnaka
    -- {license = "license:xxxx3", totalSlot = 3},
    -- {license = "license:xxxx4", totalSlot = 4},
    -- {license = "license:xxxx5", totalSlot = 1},
}


-- This structure configures extra slot allocations based on Discord roles.
-- The `Slots.DiscordPerm` structure allows you to assign additional slots to users
-- based on specific Discord roles that they possess

Slots.DiscordPerm = {
    status = false, -- Set to true to enable this feature, or false to disable it.
    role = {
        {id = "roleid", addExtraSlot = 20}, -- Example: Users with this role will have 20 + Config.DefaultSlots = 25 in total.
        {id = "roleid", addExtraSlot = 3}, -- Replace 'roleid' with your Discord role ID and specify the total extra slots.
        {id = "roleid", addExtraSlot = 4}, -- Repeat this pattern for as many roles as you need.
        {id = "roleid", addExtraSlot = 5},
        {id = "roleid", addExtraSlot = 6},
    }
}
